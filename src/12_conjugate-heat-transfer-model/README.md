# Conjugate Heat Transfer Model

Simulate the heat transfert between a solid and a fluid mean necessity a CHT model.
Several solvers that implements these model are present, the most common are called:

  - <b> chtMultiRegionFoam </b>

  - <b> chtMultiRegionSimpleFoam </b> → steady state version of chtMultiRegionFoam

These allow the definition of multiple regions in the domain by setting up
computational meshes, models and conditions separately for each region,
including solid-only ones.

## Region characterization

In "constant/<regionName>/thermophysicalProperties" you have to be consistent with the nomenclature,
then in the dictionary section ```thermophysicalProperties.thermo.type``` you will usually set 
"heRhoThermo" for setting the fluid region and "heSolidThermo" for the solid region other then defining 
the file "constant/regionProperties" such as:

```c#
    ...
    object      regionProperties;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

regions
(
    fluid       (fluid_domain)
    solid       (aluminum gold regionNameN)
);
```

## Mesh partition practice

At first you must define different regions, using the ```topoSet``` utility ( which 
follows "system/topoSetDict") to set different cellZones:

```sh 
topoSet
```
An example of topoSet can be the following one, which separates threee fluid with a solid region,
and apply a face zone:

```c++
...
    object      topoSetDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

actions
(
   FaceZones
    {
            name copperLayerAirSET;
            type faceSet;
            action new;
            source patchToFace;
            sourceInfo { patch copperLayerAir; }
    }

    {
        name      copperLayerAir;
        type      faceZoneSet;
        action    new;
        source    setToFaceZone;
        faceSet   copperLayerAirSET;
    }
    
   // CellZones
    {
        name           notPCB;
        type           cellSet;
        action         new;
        source         zoneToCell;
        zones          ( water air hydrogen);
    }
    {
        name    solid;
        type    cellSet;
        action  new;
        source  boxToCell;
        box     (-1 -1 -1) (1 1 1);
    }
    {
        name    solid;
        type    cellSet;
        action  subtract;
        source  cellToCell;   // select all the cells from given cellSet(s).
        set     notPCB ;
    }
    {
        name    PCB;
        type    cellZoneSet;
        action  new;
        source  setToCellZone;
        set     solid ;
    }

);

```
Then split the mesh to create interfaces and distinct regions to couple the CHT model:

```sh
splitMeshRegions -cellZonesOnly -overwrite
```

This will overwrite a new mesh, divided into different CellZones. 

```sh
checkMesh -region <nameRegion>
```

## Thermal boundary conditions

Instead as BC in 0, for selecting the thermal conductivity aside of
kappaMethod you need to introduce the keywords:

  - <b> lookup </b> →  the used thermal conductivity is specified in the own
    boundary field by means of the name kappa. kappa is the name of the
    field.

  - <b> fluidthermo </b> →  the used thermal conductivity is the one corresponding
    to the fluid, specified in <material>/thermophysical

  - <b>  solidthermo </b> →  the used thermal conductivity is the one corresponding
    to the solid, specified in <material>/thermophysical

  - <b> directionalSolidThermo </b> -> the thermal conductivity is the one
    corresponding to an orthotropic material, and it is specified in
    <material>/thermophysical (directionalKSolidThermoCoeffs)

## Parallel execution with multiple regions 

To decompose a case with more than one region it is opportune that every region has
directives to decompose the case. An option is to create symbolic link to all your 
decomposition files for consistency, such as:

```sh
ln -s system/decomposeParDict system/<solidRegion1>/decomposeParDict
ln -s system/decomposeParDict system/<fluidRegion1>/decomposeParDict
```
Same applies to the "fvSolution" and "fvSchemes":

```sh
ln -s system/fvSolution_solid_regions system/<solidRegion1>/fvSolution
ln -s system/fvSolution_solid_regions system/<solidRegion2>/fvSolution
```

Then decompose and run the case through:

```bash
decomposePar -allRegions
mpirun -n <nProcessors>  $(getApplication) -parallel
```

### Script example

This script aims to show most of the commands that a CHT case usually require:

```bash
#!/bin/bash

SLURM_NTASKS=16

./Allclean
source /opt/OpenFOAM/OpenFOAM-v2206/etc/bashrc           # Source the Openfoam binaries
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Source run functions
rm -r log;
mkdir log

for region in $(foamListRegions)
do
    rm -r constant/$region/polyMesh;
done
echo "Eliminated mesh create in old regions"

restore0Dir
surfaceFeatureExtract > ./log/surfaceFeatureExtract.log 2>&1  && echo "surfaceFeatureExtract Executed/n"
blockMesh  > ./log/blockMesh.log 2>&1  && echo "blockMesh Executed"
decomposePar -force  > ./log/decomposePar1.log 2>&1 && echo "decomposePar1 Executed"
mpirun -np $SLURM_NTASKS snappyHexMesh -parallel -overwrite > ./log/snappyHexMesh.log 2>&1 && echo "snappyHexMesh Executed"

##  ----------------------   PARALLEL CORES   -----------------------------------------------

mpirun -np $SLURM_NTASKS topoSet -parallel > ./log/topoSet  2>&1 && echo "topoSet Executed"
mpirun -np $SLURM_NTASKS splitMeshRegions -cellZonesOnly -overwrite -parallel > ./log/splitMesh.log 2>&1 && echo "splitMeshRegions Executed"
mpirun -np $SLURM_NTASKS checkMesh -parallel > ./log/checkMesh-EVERYCELLZONES.log 2>&1 && echo "checkMesh Executed"

## Create a new 0/regions/* following a single dictionry 
for region in $(foamListRegions)
do
  mpirun -np $SLURM_NTASKS changeDictionary -region $region -parallel > ./log/changeDictionary.$region.log 2>&1
done
echo "changeDictionary Executed"

## ---------------------------  Calculations in parallel start -------------------------------------------------------

mpirun -np $SLURM_NTASKS $(getApplication) -parallel   > ./log/$(getApplication).log 2>&1 && echo "$(getApplication) Executed"
reconstructParMesh -constant -allRegions > ./log/reconstructParMesh.log 2>&1
```

### Thin walls

For introducing thin walls inside your domain:

```c++
thicknessLayers ( \<thicknessOfTheLayer\> );
kappaLayers ( \<thermalConductivityOfTheLayer\> );
```
Check the "constant/<regionName>/polyMesh/boundary" on to check the
interface type which should be of this kind type: solidThermo for the
solid and type: fluidThemo for the fluid. Other than that, it is necessary 
that the interface will be declared as in "constant/<region1>/polyMesh/boundary"

```c++
type: mappedWall
```

### Baffles generation

In thermal problems it is often necessary resolve thin walls. Hence baffle modelling result to be a good choice if the computaional power is not adapt to solve little features.

```c++
    ...
    object      createBafflesDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

// Whether to convert internal faces only (so leave boundary faces intact).
// This is only relevant if your face selection type can pick up boundary
// faces.
internalFacesOnly true;

// Baffles to create.
baffles
{
    copperLayers
    {
        type        searchableSurface;
        surface     triSurfaceMesh;
        name        copperLayers.stl;

        patchPairs
        {
            type wall;      //mappedWall;

            sampleMode      nearestPatchFace;
            sameGroup       off;
            patchFields
            {
                p
                  {
                    type            calculated;
                    value           uniform 0;
                  }

                  T
                    {
                    type            compressible::thermalBaffle1D<hConstSolidThermoPhysics>;
                    thickness       uniform 35E-06;    // thickness [m]
                    qs              uniform 0;         // heat flux [W/m2]
                    value           uniform 350;

                    specie
                    {
                        molWeight   63.546;   // g/mol
                    }

                    transport
                    {
                        kappa   401;          // W/(m·K)
                    }

                    thermodynamics
                    {
                        Hf      0;
                        Cp      3900;
                    }

                    equationOfState
                    {
                        rho     8920;
                    }
                }
            }
        }
    }
}
```
Then the execution should look like the following example:

```sh
createBaffles -region PCB  -overwrite >  ./log/createBaffles  2>&1 && echo "createBaffles Executed"
```

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
