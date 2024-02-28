# Internal flow

To fix the boundary conditions, prepare watertight STL files as
inlet.stl, outlet.stl, ect. Then in ```system/snappyHexMeshDict.geometry``` define:
section

```c++
geometry
{
    inlet.stl
    {
        type triSurfaceMesh;  // It grabs STL files from constant/triSurface
        name inlet;
    }
    outlet.stl
    {
        type triSurfaceMesh;
        name outlet;
    }
    wall.stl
    {
        type triSurfaceMesh;
        name wall;
    }
}

```
While in the refinement surfaces section you can address the
info of the patch:

```c++
refinementSurfaces
{
    inlet
    {

        level (2 2);
        patchInfo
        {
            type patch;
        }
    }
    outlet
    {

        level (2 2);
        patchInfo
        {
            type patch;
        }
    }
    wall
    {
        level (2 2);
        patchInfo
        {
            type wall;
        }
    }
}
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
  $("#footer").load("../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
