# cfMesh 

CfMesh is a mesher which is integrate in OpenFOAM® such as
SnappyHexMesh and it is possible to find the tutorial relatives to it
in:

```sh
/opt/OpenFOAM/OpenFOAM-v2206/modules/cfmesh/tutorials
```

The modalities to create a mesh pass always through the creation of a .stl
bodies as boundaries, i.e. create all different .stl file as surface
(ASCII and divided per patch that you intend to apply a boundary
condition)

```sh
cat body_1.stl body_2.stl body_N.stl >> combined.stl
```

To permit at the program to select different patches of the geometry,
remember to check inside the combined file and ensure there is a space
between the joint of the different STL files. To create the .fms file
needed to run the cfMesh utilities (specific for OpenFoam®) run the
following commands.

```sh
surfaceFeatureEdges –angle 15 combined.stl combined.fms
```

The flag ```angle``` permit to capture correctly sharp corner of
the geometry, the lower is set the more it will be precise and
computationally expensive, I found 15 being a good compromise, the
default is 45. Secondly, to set the boundary condition in the easiest
way, open the .fms file (the OpenFOAM® format) to change the type of
boundaries (wall, patch, empty) in the first rows. Then the following
modifications acts on the dictionary system/meshDict. Then to run the
cited dictionary type the command:

```sh
cartesianMesh
```

For command to run require that the directory ```system/meshDict``` contain
only the voice:
```c++
surfaceFile "…";

maxCellSize "…";
```
If you are not satisfied with the result, try to run these utilities to
improve the results:

```sh
improveMeshQuality
```
<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
