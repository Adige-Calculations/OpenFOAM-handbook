# Shell scripting

These are script files, for running all the commands related to the
case. You can open it using any editor and see the commands executed from it.
Taking as example the native bash script often present in tutorial
cases ```Allrun``` and ```Allclean```, the follwing command will execute them:

```sh
./Allrun
```

It will run all the command necessary to run the tutorial. While:

```sh
./Allclean
```
It will run all the command necessary to clean the tutorial.
To write you bash script, start a new file with the notation:

```bash
#!/bin/bash
```
then followed by the command you want to execute.
Elevate the file permission adding execution permission through

```sh
chmod +x shellScript.sh
```
For running your bash script, type:
```sh
./shellScript.sh
```
An example of a bash script to automate a thermal analysis is presented here:

```sh
#!/bin/bash

#------------------------------------------------------------------------------

SLURM_NTASKS=16                                          # Processor number defined here 
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Source run functions

# Remove previous log directory for job monitoring and previous run file
./Allclean
rm -r log;
mkdir log

# Remove all mesh region present in the case
for region in $(foamListRegions)
do
    rm -r constant/$region/polyMesh;
done
echo "Eliminated mesh on old regions"

# Mesh generation
restore0Dir
surfaceFeatureExtract                                       > ./log/surfaceFeatureExtract.log  2>&1  && echo "surfaceFeatureExtract Executed/n"
blockMesh                                                   > ./log/blockMesh.log 2>&1  && echo "blockMesh Executed"
decomposePar -force                                         > ./log/decomposePar1.log 2>&1  && echo "decomposePar1 Executed"
mpirun -np $SLURM_NTASKS snappyHexMesh -parallel -overwrite > ./log/snappyHexMesh.log 2>&1 && echo "snappyHexMesh Executed"

# Addional mesh zones operation
reconstructParMesh -constant                                > ./log/reconstructParMesh1         2>&1 && echo "Reconstruct Case"
topoSet                                                     > ./log/topoSet  && echo "topoSet Executed"
splitMeshRegions -cellZonesOnly -overwrite                  > ./log/splitMesh.log 2>&1 && echo "splitMeshRegions Executed"
checkMesh                                                   > ./log/checkMesh.log                   2>&1 && echo "checkMesh Executed"
createBaffles -region PCB  -overwrite                       >  ./log/createBaffles     2>&1 && echo "createBaffles Executed"

for region in $(foamListRegions)
  do
     changeDictionary -region $region                       > ./log/changeDictionary.$region.log 2>&1
  done
echo "changeDictionary Executed"

decomposePar -force -allRegions                             > ./log/decomposePar2 2>&1 && echo "decomposePar2 Executed"
mpirun -np $SLURM_NTASKS $(getApplication) -parallel        > ./log/$(getApplication).log 2>&1 && echo "$(getApplication) Executed"

reconstructParMesh -constant -allRegions                    > ./log/reconstructParMesh.log 2>&1 && echo "Finished"

#------------------------------------------------------------------------------
```

## Parametric study

To develop a parametric study, hence you change one or more  variables to get the consequent result
of this boudnary conditions change. You can use the ```sed``` command to drive the dictionary changes:

```sh
sed -i '/^[[:space:]]*massFlowRate/c\ massFlowRate 1000;'  0/U
```  

This above command substitute the row that contain the word "massFlowRate" with the follwing: "massFlowRate 1000;".
Creating a bash script to automate this practise will look similar to the following:

```sh
#!/bin/bash

SLURM_NTASKS=14
list_mass_flow_rate=(1.14E-04  2.29E-04  3.43E-04)

# Source run functions
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        
rm -r log;
mkdir log

# Build the mesh
surfaceFeatureExtract > ./log/surfaceFeatureExtract.log 2>&1  && echo "surfaceFeatureExtract Executed/n"
blockMesh  > ./log/blockMesh.log 2>&1  && echo "blockMesh Executed"
decomposePar -force  > ./log/decomposePar1.log 2>&1 && echo "decomposePar1 Executed"
mpirun -np $SLURM_NTASKS snappyHexMesh -parallel -overwrite > ./log/snappyHexMesh.log 2>&1 && echo "snappyHexMesh Executed"
mpirun -np $SLURM_NTASKS checkMesh -parallel > ./log/checkMesh.log 2>&1 && echo "checkMesh Executed"
reconstructParMesh -constant > ./reconstructParMesh.log 2>&1 && echo "reconstructParMesh Executed"


for flowRateValue in "${list_mass_flow_rate[@]}"
do
        rm -r process*;

        # Modify the 0/U directory with a new value of massflow rate
        sed -i "/^[[:space:]]*massFlowRate/c\ massFlowRate $flowRateValue ;"  0.orig/U  && echo "Changed 0/U with $flowRateValue kg/s"
        restore0Dir > ./log/restore0Dir.$flowRateValue.log 2>&1 && echo "restore0Dir $flowRateValue  Executed"
        decomposePar -force > ./log/decomposePar.$flowRateValue.log 2>&1 && echo "decomposePar $flowRateValue  Executed"
        mpirun -np $SLURM_NTASKS $(getApplication) -parallel   > ./log/$(getApplication).$flowRateValue.log 2>&1 && echo "$(getApplication) $flowRateValue Executed"
        reconstructPar -latestTime > ./log/reconstructParMesh.$flowRateValue.log 2>&1  && echo "reconstructPar $flowRateValue Executed"

        # Take the newly created directory and re-name it as the flow rate
        mv $(ls -1tr | tail -1) $flowRateValue
done
```

## Find bugs 

The utility ```shellcheck``` provide warnings and suggestions for bash/sh 
shell scripts. Run the following for instant output: 

```sh
shellcheck yourscript.sh
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
