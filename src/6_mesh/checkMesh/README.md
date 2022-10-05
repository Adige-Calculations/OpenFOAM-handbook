# checkMesh

checkMesh will check for:

  - Mesh statistics and typology.

  - Topology.

  - Geometry and mesh quality (bounding box, cell volumes,
    skewness, orthogonality, aspect ratio, and so on).

If for any reason checkMesh finds errors (errors must be repaired), it
will give you a message and it will tell you what check failed, writing
a set with the faulty cells, faces, and/or points In the directory ```constant/polyMesh/sets/```.
To check all the possible measurable parameters (often an overkill utilities) of the mesh,
and visualise all the fields, run:

```console
checkMesh -allGeometry -allTopology -writeAllFields -writeSets vtk
```

Most of the time it is impossible to get no errors when we look at all the mesh fields.
A more progmatic way, is to write the field when you encouter an error without flags,
so you can post-process via ParaView your mesh and check where the cells degenerate

```console
checkMesh -writeSets vtk
```

It will write to ```constant/polyMesh/sets/``` the Sets and cellZones.

## Improve quality
As advice to improve the quality of the mesh try to remove as much as
possible tetrahedra and tet wedges. Then is very important to check
minVolume (if it is negative, check the .stl files or setting).