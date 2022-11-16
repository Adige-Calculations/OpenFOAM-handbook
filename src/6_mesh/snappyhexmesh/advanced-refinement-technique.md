# Advanced refinement technique

The necessity to refine area that sometimes require a complex shape can
be satisfied through the usage of an STL file as a cellZone entry.
First, define a closed STL file through snappyHexMeshDict.geometry then
use this frame in the respective snappyHexMeshDict sector

```c++
    refinementSurfaces
    {
        <closeSTLFileYouWantToRefine>
        {
            level (1 2);

            cellZone <\name\>;
            faceZone <\name\>;
            cellZoneInside inside;
        }
      …
    refinementRegions
    {
        <closeSTLFileYouWantToRefine>
        {
            mode <\mode\>;
            levels ((0.000008 3));
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
