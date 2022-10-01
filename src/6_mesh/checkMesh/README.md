# checkMesh


checkMesh will look for/check for:

  - Mesh stats and overall number of cells of each type.

  - Check topology (boundary conditions definitions).

  - Check geometry and mesh quality (bounding box, cell volumes,
    skewness, orthogonality, aspect ratio, and so on).

If for any reason checkMesh finds errors (errors must be repaired), it
will give you a message and it will tell you what check failed, writing
a set with the faulty cells, faces, and/or points In the directory
constant/polyMesh/sets/

To check all the parameters (often an overkill utilities) of the mesh
like quality parameters run:

```console
checkMesh -allGeometry -allTopology -writeAllFields -writeSets vtk
``` 

This additive options permit to visualise all the fields and most of the
time is impossible to make them have a positive outcome, hence a simple:

```console
checkMesh -writeSets vtk
```

Will write to constant/polyMesh/sets/ the Sets to permit to check the
most important features cellZones in your domain via ParaView

As advice to improve the quality of the mesh try to remove as much as
possible tetrahedra and tet wedges. Then is very important to check
minVolume (if it is negative, check you STL or
setting)