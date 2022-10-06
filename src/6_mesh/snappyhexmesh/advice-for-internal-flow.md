# Internal flow

To fix the boundary conditions, prepare watertight STL files as
inlet.stl, outlet.stl, ect. Then in snappyHexMesh define it in geometry
section
```c++
geometry
{
    inlet.stl
    {
        type triSurfaceMesh;
        name inlet;
    }
        outlet.stl
    {
        type triSurfaceMesh;
        name outlet;
    }
}

```
While in the refinement surfaces section you can define the address the
info of the patch:
```c++
refinementSurfaces
    {
        inlet
        {

            level (2 2);
            patchInfo
                        {
                        type patch;
                        }
        }
        outlet
        {

            level (2 2);
            patchInfo
                        {
                        type patch;
                        }
        }
        wall
        {
            
            level (2 2);
            patchInfo
                        {
                        type wall;
                        }
        }
}
```
