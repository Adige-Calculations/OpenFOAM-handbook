# Problem initialization and interpolation from previous results

If it is not available any previous solution, run:

```console
potentialFoam
```

a solver for the fluid velocity potential to overwrite ```0/U``` with an approximate solution of the field. Instead,if data are present from a previous solution it is possible to map the fields to interpolate the results on the new mesh, running:

```console
mapFields -consistent -sourceTime <\iteration number\> <\path of the
base case\>
```
This will overwrite ```0/*``` with the value of
the case interpolating the result in the mesh in interest. If you do not
specify the flag "-consistent", it is necessary build a mapFieldsDict (not adivced).

To reorder the indexing of the matrix to get the more sparse matrix as possible, before launching the calculation use:

```console
renumberMesh
```