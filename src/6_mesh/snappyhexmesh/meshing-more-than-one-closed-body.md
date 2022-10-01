# Meshing multiples closed body


To permit the recognition of different closed STL files the
sub-dictionary snappyHexMesh/castellatedMeshControls/locationInMesh must
be modified in snappyHexMesh/castellatedMeshControls/locationsInMesh and
follow the template:

```c++
    …
   locationsInMesh 
      (
        ((0.010276 0.058958 0.000248) zone1) 
  	    ((0.011472 0.10046  0.000256) zone2)
       );
   …
```

In this scenario, it is possible to introduce to bodies as a single mesh
without recurring to use the utility mergeMeshes. The bodies will be
distinguished from a different cellZones allocations.
