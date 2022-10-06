# Problem initialization and interpolation from previous results

If it is not available any previous solution, run

```console
potentialFoam
```

to overwrite 0/U with an approximate solution of the field. Instead, to
map the solution from a coarse mesh to a finer mesh with different mesh
run:

```console
mapFields -consistent -sourceTime <\iteration number\> <\path of the
base case\>
```
to interpolate the results. This will overwrite ./0 with the value of
the case interpolating the result in the mesh in interest. If you do not
specify -consistent it is necessary, build a mapFieldsDict (not adivced).

To reorder the sparse matrix before launch the calculus:
```console
renumberMesh
```