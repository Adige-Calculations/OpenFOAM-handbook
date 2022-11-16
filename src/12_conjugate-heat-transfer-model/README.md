# Conjugate Heat Transfer Model

Several solvers:

  - chtMultiRegionFoam

  - chtMultiRegionSimpleFoam → steady state version of chtMultiRegionFoam

Allows for defining multiple regions in the problem domain by setting up
computational meshes, models and conditions separately for each region,
including solid-only (metal) ones. The steady-state flow and heat
transfer in the complete domain is obtained by solving the mass,
momentum and energy conservation equations simultaneously in all
regions, including the thermal coupling among them.

Create the mesh

Use topoSet (dependent on topoSetDict) to set different cellZones in
your domain

Then split the mesh to create interfaces and different body with the
following

```console
splitMeshRegions -cellZonesOnly -overwrite
```
And generate the
```console
changeDictionary -region <\region1\>
```
```console
changeDictionary -region <\region2\>
```
Follow the following tutorial to set up a case:

Check the constant/water/thermophysicalProperties, in the
thermophysicalProperties.thermo.type you should find heRhoThermo for the
fluid region and heSolidThermo for the solid region.

## Thermal boundary conditions
Instead as BC in 0, for selecting the thermal conductivity aside of
kappaMethod you need to introduce the keywords:

  - lookup: the used thermal conductivity is specified in the own
    boundary field by means of the name kappa. kappa is the name of the
    field.

  - fluidthermo: the used thermal conductivity is the one corresponding
    to the fluid, specified in \<material\>/thermophysical

  - solidthermo: the used thermal conductivity is the one corresponding
    to the solid, specified in \<material\>/thermophysical

  - directionalSolidThermo: the thermal conductivity is the one
    corresponding to an orthotropic material, and it is specified in
    \<material\>/thermophysical (directionalKSolidThermoCoeffs)

For introducing thin walls:

```c
thicknessLayers ( \<thicknessOfTheLayer\> );
kappaLayers ( \<thermalConductivityOfTheLayer\> );
```
Check the constant/\<region\>/polyMesh/boundary on to check the
interface type which should be of this kind type: solidThermo for the
solid and type: fluidThemo for the fluid. Other than that, it is
necessary that the interface will be declared as

type: mappedWall

## Baffles generation

In thermal problems it is often necessary resolve thin walls. Hence baffle modelling result to be a good choice if the computaional power is not adapt to solve little features.

```c++
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
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


// ************************************************************************* //
```
Then the execution in done via:

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
