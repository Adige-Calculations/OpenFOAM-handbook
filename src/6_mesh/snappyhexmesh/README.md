# SnappyHexMesh

In order to define the patches in snappyHexMesh you need to use
different STL file that can couple in a watertight geometry. Use the
utility surfaceCheck to proof that your STL is watertight.

The files to entry in the command are the parts of the 3D complex draw
in STL format (exclusively written in ASCII) and they must be copied in
constant/triSurface. Then modify the file sytem/surfaceFeatureDict
substituting and adding the entries and modifying the featured angles
(170°(advised) - 180°: you include all the angle between two neighboured
cells, lowering this value it wouldn’t be consider these cells and it
will be applied a merged cell)

```console
surfaceFeatureExtract
```

The geometry components must be costant/triSurface directory rigorously
in this format ```\<file\>.stl``` and after having launched the command in
the same folder should appear ```\<file\>.eMesh``` and a new directory
will appear in constant/extendedFeatureEdgeMesh/

If you want to extract very thin layer, use the utility

```console
extrudeMesh
 ```
dependent on the dictionary ```system/extrudeMeshDict``` to extrude some layers
externally to the geometry, however, make sure that those created are
very thin.

<table>
<thead>
<td>snappyHexMesh -overwrite</td>
<th><strong>Single core</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>decomposePar</p>
<p>mpirun -n 16 snappyHexMesh -parallel -overwrite</p>
<p>reconstructParMesh -latestTime -constant</p></td>
<td><strong>Parallel process </strong></td>
</tr>
</tbody>
</table>
