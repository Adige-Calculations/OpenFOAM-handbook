# Parallelization issues

If you forgot to restore the 0 directory before the case decomposition,
what you can do is tp reconstruct the mesh and decompose it again with
the 0 folder in place with:

```console
reconstructParMesh -constant
```
```console
decomposePar -force
```
When is reconstructed only the mesh, and the redecomposed to include the
0 dir. and error can occur when triyng to reconstruct the concluded case
at the end. A solution is to run:
```console
reconstructParMesh -constant && reconstructPar -latestTime
```