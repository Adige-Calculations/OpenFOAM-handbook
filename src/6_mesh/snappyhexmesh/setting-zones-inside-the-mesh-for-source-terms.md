# Setting zones inside the mesh for source terms

Sets and Zones, can store any mesh entity (point, face or cell) in a
data structure that is somewhat similar to a list. The major difference
is in the internal handling of the mesh entities, especially in the case
of a parallel simulation with topological mesh changes. In this case,
the addressing in the list has to be updated accordingly and only the
zone provides such a method (use cellZone for this purpose).

  - pointSet/faceSet/cellSet provide a named list of point/face/cell
    indexes. Essentially, it's just the result of a selection of
    points/faces/cells, so that you can then do something with them,
    since you know which ones you want. Usually, these sets are used for
    data sampling and for creating faceZones or cellZones

  - cellZone are an extension to the sets, since zones provide
    additional information useful for mesh manipulation. Zones are
    commonly used for MRF, baffles, dynamic meshes, porous mediums and
    other features available through the dictionary system/fvOptions

Sets can be used to create Zones and vice versa. As a reminder first
create a cellSet and then fed the cell set into the creation of the
cellZone to use fvOptions

The selection is usually performed by the tools, both of which can
select subsets of the mesh and perform boolean operations on them

  - setSet → Use an interactive window

  - topoSet → Use a dictionary in ```system/topoSetDict```

Two example of topoSet  are listed below:

## The implementation of 2 cellZones from STL files:

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
    {
        name    HE_frontCellSet;
        type    cellSet;
        action  new;
        source  searchableSurfaceToCell;//surfaceToCell;
        surfaceType  triSurfaceMesh;
        surfaceName    HE_front.stl; 
    }
    {
       name HE_front;
       type cellZoneSet;
       action new;          // new cellSet, it doesn't simply add to a previous cellSet
       source setToCellZone;//zoneToCell;
       set  HE_frontCellSet;

    }
    {
        name    HE_frontLateralCellSet;
        type    cellSet;
        action  new;
        source  searchableSurfaceToCell;//surfaceToCell;
        surfaceType  triSurfaceMesh;
        surfaceName    HE_frontLateral.stl; 
    }
    {
       name HE_frontLateral;
       type cellZoneSet;
       action new;   // new cellSet, it doesn't simply add to a previous cellSet
       source setToCellZone;//zoneToCell;
       set  HE_frontLateralCellSet;
    }
);
```
## Implementation of cellZones and faceZones
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
()
   // FaceZones
    {
        name      baffleSET;
        type      faceSet;
        action    new;
        source    surfaceToCell;
        file      copper.stl;
    }
    {
        name        baffle;
        type        faceZoneSet;
        action      new;
        source      setToFaceZone;
        faceSet     baffleSET;
    }

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

### Delete a zone
To visualize how much Cell Zone there is inside the domain run
checkMesh, while if you desire to delete a cellZone, delete the files
that topoSet creates in: ```constant/polyMesh/sets```
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
