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

```sh
surfaceFeatureExtract
```

The geometry components must be costant/triSurface directory rigorously
in this format ```<file>.stl``` and after having launched the command in
the same folder should appear ```<file>.eMesh``` and a new directory
will appear in constant/extendedFeatureEdgeMesh/

If you want to extract very thin layer, use the utility

```sh
extrudeMesh
 ```
dependent on the dictionary ```system/extrudeMeshDict``` to extrude some layers
externally to the geometry, however, make sure that those created are
very thin.

## How to start a case in single and parallel

After the execution of:
```sh
surfaceFeatureExtract
```
The following commands will start the meshing process:


| Single process                | Parallel processes             |
| -------------------------- | ------------------- |
| snappyHexMesh -overwrite   | decomposePar -force        |
|                            | mpirun -n 16 snappyHexMesh -parallel -overwrite       |
|                            | reconstructParMesh -latestTime -constant |


## Meshing multiples bodies

If you want to mesh different entities with separate mesh, you might run twice 
snappyHexMesh with different value of Location in mesh and then use the tool ```mergeMesh```.
Otherwise you can use the dictionary before running the mesh.
To permit the recognition of different closed STL files the
sub-dictionary "snappyHexMesh.castellatedMeshControls.locationInMesh" must
be modified in "snappyHexMesh.castellatedMeshControls.locationsInMesh" and
follow a similar resolution:

```c++
    …
   locationsInMesh
      (
        ((0.010276 0.058958 0.000248) zone1)
  	    ((0.011472 0.10046  0.000256) zone2)
       );
   …
```

In this scenario, it is possible to introduce to bodies as a single mesh
without recurring to use the utility ```mergeMeshes```. The bodies will be
distinguished from a different cellZones allocations.

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
