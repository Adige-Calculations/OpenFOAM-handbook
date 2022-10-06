# Parallelization issues

If you forgot to restore the 0 directory before the case decomposition,
what you can do is to reconstruct the mesh and decompose it again with
the 0 folder in place with:

```console
reconstructParMesh -constant
restore0Dir
decomposePar -force
```
When it is reconstructed only the mesh, and decomposed a second time to include the
0 directory, an error can occur when triyng to reconstruct at the conclusion of the
case. A solution is to run:
```console
reconstructParMesh -constant && reconstructPar -latestTime
```