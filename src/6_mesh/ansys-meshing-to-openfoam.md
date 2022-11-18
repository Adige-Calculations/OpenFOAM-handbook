# ANSYS Meshing to OpenFoam®

OpenFoam® needs to read a mesh via file written in ASCII format, if it comes from another
program. As a consequence to export a Fluent .msh file in ASCII format the shortest way
(from ANSYS meshing) is:

File → Option → Meshing → Export → Format of input file (.msh)

Choose ASCII and then you can easily extract the file in ASCII format by
exporting the mesh. Then move the produced file on the root directory of your case
and run:

```console
fluentMeshToFoam foo.msh
```

Remember that it is good practice check the boundary setting in
```constant/polyMesh/boundary``` after a conversion
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
