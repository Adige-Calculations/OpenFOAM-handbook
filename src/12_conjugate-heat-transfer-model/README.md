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