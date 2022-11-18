# Advanced refinement technique

The necessity to refine area that sometimes require a complex shape can
be satisfied through the usage of an STL file as a cellZone entry.
First, define a closed STL file through "snappyHexMeshDict.geometry" then
use this frame in the respective ```snappyHexMeshDict``` sector:

```c++
    ...

    refinementSurfaces
    {
        <closedSTLFileYouWantToRefine>
        {
            level (1 2);

            cellZone        <nameCellZone>;
            faceZone        <nameFaceZone>;
            cellZoneInside  inside;
        }
      
    …

    refinementRegions
    {
        <closeSTLFileYouWantToRefine>
        {
            mode   <mode>;            // can be "distance" , "inside" or "outside"
            levels ((0.000008 3));
        }
    }

    ...
```