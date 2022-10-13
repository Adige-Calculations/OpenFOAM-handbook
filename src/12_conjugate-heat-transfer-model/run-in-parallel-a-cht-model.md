# Run in parallel a CHT model

To decompose a case with more than one region it is opportune to run
this shell script in a way that you correctly distribute the regions
between the processors:

And the decompose the case through:
```bash
decomposePar -allRegions
```

Remember to create symbolic link to all your
```bash
/system/\<region>/decomposeParDict -> system/decomposeParDict
mpirun -n \<nProcessors> \<solver> -parallel
```

## Script example
This script aims to show most of the action that a CHT case usually require:

```bash
#!/bin/bash

#------------------------------------------------------------------------------

SLURM_NTASKS=16

./Allclean
source /opt/OpenFOAM/OpenFOAM-v2206/etc/bashrc           # Source the Openfoam binaries
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Source run functions
rm -r log;
mkdir log

for region in $(foamListRegions)
do
    rm -r constant/$region/polyMesh;
done
echo "Eliminated mesh create in old regions"

restore0Dir
surfaceFeatureExtract > ./log/surfaceFeatureExtract.log 2>&1  && echo "surfaceFeatureExtract Executed/n"
blockMesh  > ./log/blockMesh.log 2>&1  && echo "blockMesh Executed"
decomposePar -force  > ./log/decomposePar1.log 2>&1 && echo "decomposePar1 Executed"
mpirun -np $SLURM_NTASKS snappyHexMesh -parallel -overwrite > ./log/snappyHexMesh.log 2>&1 && echo "snappyHexMesh Executed"

## --------------------   SINGLE CORE -------------------------------------------- #

# reconstructParMesh -constant > ./log/reconstructParMesh1 2>&1 && echo "Reconstruct Case"
# topoSet  > ./log/topoSet  && echo "topoSet Executed"
# splitMeshRegions -cellZonesOnly -overwrite > ./log/splitMesh.log 2>&1 && echo "splitMeshRegions Executed"
# checkMesh > ./log/checkMesh-EVERYCELLZONES.log 2>&1 && echo "checkMesh Executed"
# createBaffles -region PCB  -overwrite >  ./log/createBaffles  2>&1 && echo "createBaffles Executed"

## Create a new 0/regions/* following a single dictionary in system/region/changeDIcitonaryDict
# for region in $(foamListRegions)
# do
#   changeDictionary -region $region > ./log/changeDictionary.$region.log 2>&1
# done
# echo "changeDictionary Executed"
# decomposePar -force -allRegions  > ./log/decomposePar2 2>&1 && echo "decomposePar2 Executed"

##  ----------------------   PARALLEL CORES   -----------------------------------------------

mpirun -np $SLURM_NTASKS topoSet -parallel > ./log/topoSet  2>&1 && echo "topoSet Executed"
mpirun -np $SLURM_NTASKS splitMeshRegions -cellZonesOnly -overwrite -parallel > ./log/splitMesh.log 2>&1 && echo "splitMeshRegions Executed"
mpirun -np $SLURM_NTASKS checkMesh -parallel > ./log/checkMesh-EVERYCELLZONES.log 2>&1 && echo "checkMesh Executed"

## Create a new 0/regions/* following a single dictionry 
for region in $(foamListRegions)
do
  mpirun -np $SLURM_NTASKS changeDictionary -region $region -parallel > ./log/changeDictionary.$region.log 2>&1
done
echo "changeDictionary Executed"

## ---------------------------  Calculations in parallel start -------------------------------------------------------

mpirun -np $SLURM_NTASKS $(getApplication) -parallel   > ./log/$(getApplication).log 2>&1 && echo "$(getApplication) Executed"
reconstructParMesh -constant -allRegions > ./log/reconstructParMesh.log 2>&1
```