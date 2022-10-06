# Deletion of bad quality cells

You can delete bad cells if they are not in region of interest, if this
is the case, utilities such as ```setSet``` and ```subsetMesh``` can be
useful tools, otherwise it is strongly advised to re-mesh.

## Check the mesh
After checking the quality and writing the problematic cells in ```cellSets```
with:

```console
checkMesh -allTopology - allGeometry
```

It is possible to delete the problematic cells with the utility:

```console
setSet -constant
```

An internal command line will appear, and similar command can be used to
manage bad cells present in your mesh (i.e. concave, underdetermined,
zero volume cells), in this example zero volume cells are treated:
```console
cellSet c0 new cellToCell zeroVolumeCells any
```
if you want to fix additional cells and with problematic faces you can
(i.e. skew, concave, warp faces etc..)
```console
cellSet c0 add faceToCell skewFaces any
```
In the end do not forget to invert, with:
```console
cellSet c0 invert && quit
```
Once exited from the internal command line, execute the following
command to overwrite the mesh

```console
subSetMesh c0 -overwrite
```