# Modularity

A modular way to proceed during the study, especially when a list of commands starts to be extentive is to use the ```make```
utility instead of creating a bash script. First, we have to write the case inside a Makefile at the root of our project similarly to:

```bash
All: mesh parprep run reconstruct view
mesh: baseMesh regionMesh electrolyteMesh splitMesh

###############

clean:
        (rm -rf *.log [1-9]* error output proc* 0 time *.foam log stop);
        (./src/Allclean)
###############

baseMesh:
        # snappyHexMesh for mesh generation
        (blockMesh)
        (surfaceFeatureExtract)
        (snappyHexMesh -overwrite)

        # redefine zones
        (rm -f constant/polyMesh/sets/*)
        (topoSet -dict system/topoSetDict.cellZones)
        (rm -f constant/polyMesh/*Zones)
        (setsToZones)

regionMesh:
        # split mesh
        (splitMeshRegions -cellZonesOnly -overwrite)

        # copy submeshes...
        (cp -r constant/air/polyMesh subRegions/air/constant/.)
        (cp -r constant/fuel/polyMesh subRegions/fuel/constant/.)
        (cp -r constant/interconnect0/polyMesh subRegions/interconnect0/constant/.)
        (cp -r constant/interconnect1/polyMesh subRegions/interconnect1/constant/.)

        # give space for electrolyte region
        (transformPoints -translate '(0 0  2e-5)' -case "subRegions/air")
        (transformPoints -translate '(0 0 -2e-5)' -case "subRegions/fuel")
        (transformPoints -translate '(0 0  2e-5)' -case "subRegions/interconnect0")
        (transformPoints -translate '(0 0 -2e-5)' -case "subRegions/interconnect1")

electrolyteMesh:
        # generate electrolyte region
        (extrudeMesh)
        (topoSet -dict system/topoSetDict.faceSets)
        (createPatch -overwrite -dict system/createPatchDict.electrolyte)
        (rm -f constant/polyMesh/sets/*)
        (topoSet -dict system/topoSetDict.electrolyte)
        (rm -f constant/polyMesh/*Zones)
        (setsToZones)
        (rm -f constant/polyMesh/sets/*)

        # merge mesh
        (mergeMeshes . subRegions/air -overwrite)
        (mergeMeshes . subRegions/fuel -overwrite)
        (mergeMeshes . subRegions/interconnect1 -overwrite)
        (mergeMeshes . subRegions/interconnect0 -overwrite)

        (rm -rf 0)

        # stitch mesh
        (stitchMesh -perfect interconnect1_to_fuel fuel_to_interconnect1 -overwrite)
        (stitchMesh -perfect interconnect0_to_air air_to_interconnect0 -overwrite)
        (stitchMesh -perfect fuel_to_air electrolyte_to_fuel -overwrite)
        (stitchMesh -perfect air_to_fuel electrolyte_to_air -overwrite)

        (rm -rf 0)

        (attachMesh)

splitMesh:
        (rm -f constant/polyMesh/sets/*)
        (topoSet -dict system/topoSetDict.splitMesh)
        (rm -f constant/polyMesh/*Zones)
        (setsToZones)

        (topoSet -dict system/topoSetDict.inletOutlet)
        (createPatch -overwrite -dict system/createPatchDict.inletOutlet)

        (splitMeshRegions -cellZonesOnly -overwrite)

        # air region
        #
        (topoSet -region air)
        (setsToZones -region air)

        # fuel region
        #
        (topoSet -region fuel)
        (setsToZones -region fuel)

        # electrolyte region
        #
        (topoSet -region electrolyte)
        (setsToZones -region electrolyte)

        (topoSet -dict system/topoSetDict.noCut)

        # delete
        #
        (rm -rf constant/interconnect0)
        (rm -rf constant/interconnect1)

        (rm -rf system/interconnect0)
        (rm -rf system/interconnect1)

        # mv 0 back
        (rm -rf 0)
        (cp -r src/0 .)

parallelPreparation:
        (rm -fr proc*)
        (./src/parallelPreparation.sh | tee log.parallelPreparation);

#############

parallelRun:
        (./src/parallelRun | tee log.parallelRun);
singleProcessRun:
        (fuelCellFoam | tee log.srun);

#############

reconstruct:
        (reconstructParMesh);
        (reconstructParMesh -region air -constant);
        (reconstructParMesh -region fuel -constant);
        (reconstructParMesh -region electrolyte -constant);
        (reconstructParMesh -region interconnect -constant);
        (reconstructPar);
        (reconstructPar -region air);
        (reconstructPar -region fuel);
        (reconstructPar -region electrolyte);
        (reconstructPar -region interconnect);
#############

view:
        (foamToVTK -latestTime);
        (foamToVTK -latestTime -region air);
        (foamToVTK -latestTime -region fuel);
        (foamToVTK -latestTime -region electrolyte);
        (foamToVTK -latestTime -region interconnect);
viewAll:
        (foamToVTK);
        (foamToVTK -region air);
        (foamToVTK -region fuel);
        (foamToVTK -region electrolyte);
        (foamToVTK -region interconnect);
```

It is possible to execute all the commands at once with:

```console
make All
```

Otherwise, only portion of the study can be executed such as:

```console
make baseMesh
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
