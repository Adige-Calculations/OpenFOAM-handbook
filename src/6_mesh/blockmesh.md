# blockMesh

First step is to create a dummy folder with the tutorial command:

```console
restore0Dir
```
BlockMesh is the basic mesh generators which relies on a single
dictionary file system/blockMeshDict with the command:

```console
blockMesh
```

Theg mesh will be generated inside the folder constant/polyMesh.
Parameters to control this command is in system/blockMeshDict which
defines the domain through vertices, define the blocks and set the
number of elements in the segment (be consistent – side of different
block must be the same grid refinement and bias)

In blockMesh.boundary, use the rule of the right hand to create the
normal to the surface towards the intern of the body.
