# Problem initialization and interpolation from previous results

From a a brand new case where no available data are in place from previous solution, run the laplacian solver:

```console
potentialFoam
```

this solver act only on velocity file chainging its potential to overwrite ```0/U``` with to get an
approximate solution of the field. Instead,if data are present from a previous solution it is possible
to map the fields to interpolate the results on the new mesh, running:

```console
mapFields -consistent -sourceTime <iteration number> <path of the base case>
```
This will overwrite ```0/*``` with the value of
the case interpolating the result in the mesh in interest. If you do not
specify the flag "-consistent", it is necessary build a mapFieldsDict (not adivced).

To reorder the indexing of the matrix to get the more sparse matrix as possible, before launching the calculation use:

```console
renumberMesh
```