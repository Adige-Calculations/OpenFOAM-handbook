# topoSetDict

This dictionary become more easy the more get exposed to it. Few example of topoSetDict are given.

## Divide the domain in 4 domains with different properties

```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    location    "system";
    object      topoSetDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

actions
(   
/*   // FaceZones
        {
                name baffleSET;
                type faceSet;
                action new;
                //source       searchableSurfaceToCell;
                //surfaceType  triSurfaceMesh;
                //surfaceName  copper.stl;

source      surfaceToCell;
    file    copper.stl;
    }
    {
        name        baffle;
        type        faceZoneSet;
        action      new;
        source      setToFaceZone;
        faceSet     baffleSET;
    }
*/
//  --------------------------------------------------------------------------------------------

   // CellZones
    {
        name           notPCB;
        type           cellSet;
        action         new;
        source         zoneToCell;
        zones          ( water air hydrogen);
    }
    {
        name    solid;
        type    cellSet;
        action  new;
        source  boxToCell;
        box     (-1 -1 -1) (1 1 1);
    }
    {
        name    solid;
        type    cellSet;
        action  subtract;     
        source  cellToCell;   // select all the cells from given cellSet(s).
        set     notPCB ;
    }
    {
        name    PCB;
        type    cellZoneSet;
        action  new;
        source  setToCellZone;
        set     solid ;
    }

);

// ************************************************************************* //
```


This dictonary is triggered using:
```sh
topoSet  > ./log/topoSet  && echo "topoSet Executed"
```

It will return 4 different cellZones, those cellZones can be then addressed as different region of the mesh.
```sh
splitMeshRegions -cellZonesOnly -overwrite > ./log/splitMesh.log 2>&1 && echo "splitMeshRegions Executed"
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
