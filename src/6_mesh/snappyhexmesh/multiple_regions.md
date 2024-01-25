# Multiple regions

We can create regions from ```snappyHexMesh``` setting up "system/snappyHexMeshDict" like this:

```c++
castellatedMeshControls
{
    maxLocalCells   300000;
    maxGlobalCells  9000000;
    minRefinementCells 40;
    maxLoadUnbalance 0.1;
    nCellsBetweenLevels 2;
    locationsInMesh (
        ((0.144701 0.017648  -0.042372) aluminum)
        ((0.161481 0.009546 -0.0572022) fluid_domain)

        ((0.056485 0.023659 -0.018144) plates)
        ((0.105862 0.023659 -0.018144) plates)
        ((0.172814 0.023659 -0.018144) plates)
        );

    ...
```

Following instead the follwoing "system/topoSetDict" we set cellZones around the domain
interacting with what has been implemented previously with ```snappyHexMesh```

```c++
    ...
    object      topoSetDict;
}

actions
(
    {
        name    epoxy_CellSet;
        type    cellSet;                 //  cellSet is created
        action  new;
        source  searchableSurfaceToCell; //  search from an a surface
        surfaceType  triSurfaceMesh;     //  which is defined by an stl file
        surfaceName  epoxy.stl;
    }
    {
       name epoxy;
       type cellZoneSet;
       action new;            // cellZone is created 
       source setToCellZone;  // refer to the cellSet above 
       set  epoxy_CellSet;
    }
    {
        name    copper_CellSet;
        type    cellSet;
        action  new;
        source  searchableSurfaceToCell;
        surfaceType  triSurfaceMesh;
        surfaceName  copper_heat_exchanger.stl;
    }
    {
       name copper;
       type cellZoneSet;
       action new;           
       source setToCellZone; 
       set copper_CellSet;
    }
    {
       name aluminum;
       type cellZoneSet;
       action subtract;
       source zoneToCell; 
       zones  (
        copper
        epoxy
        plates
        fluid_domain
       );
    }
)
```

if you run ```checkMesh``` you will notice the generation of multiple cellsZones such as:

```c++
Checking basic cellZone addressing...
                CellZone        Cells       Points       VolumeBoundingBox
               aluminum       569510       835668  0.000254241 (-3.020417e-06 0 -0.07205508) (0.2200032 0.02058048 8.201096e-06)
           fluid_domain      2113560      2629640 5.075231e-05 (-1.233849e-05 0.004437673 -0.062375) (0.2200123 0.02002402 -0.006539311)
                 plates       896580      1084860  1.09089e-05 (0.0145 0.02299985 -0.0655) (0.2055 0.02415002 -0.003498615)
                  epoxy       731605       946011 4.763413e-05 (0.00998581 0.02282949 -0.0670095) (0.2100142 0.0280409 -0.00191977)
                 copper      1516780      2095400 4.684542e-05 (0.009995011 0.01575065 -0.06700418) (0.210005 0.02305153 -0.001525676)
```

From there you can split the mesh for executing a multi region solver. For example a Conjugated Heat Transfer. 

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