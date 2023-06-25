# Cluster practice

Check what modules are installed:

```sh
module avail
```
A ```module``` refers to a software package or library that is available on a computing cluster. 
The ```module load``` command is used in HPC scripts to load specific modules into the user's environment.


The default environment is typically a minimal set of software packages and libraries needed to run basic commands.
However, there may be many additional software packages and libraries available on the cluster, and these can be 
loaded into the user's environment as needed using the "module load" command.


Once a module is loaded, its associated executables, libraries, and environment variables become available to the 
user's session. 

```bash
#!/bin/bash
#SBATCH --job-name=OF-Job
#SBATCH --ntasks=36
#SBATCH --output=%x_%j.out
#SBATCH --constraint=c5.18xlarge

#------------------------------------------------------------------------------

module load openmpi                                         # MPI module upload
source /fsx/programs/OpenFOAM®/OpenFOAM®-v2112/etc/bashrc   # Source OpenFOAM® binaries
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions           # Source OpenFOAM® run functions

#------------------------------------------------------------------------------

rm -r log; mkdir log
restore0Dir
decomposePar -force > ./log/decomposePar.log 2>&1
mpirun -np $SLURM_NTASKS checkMesh -parallel  > ./log/checkMesh.log 2>&1
mpirun -np $SLURM_NTASKS redistributePar -parallel -overwrite  > ./log/redistributePar.log 2>&1
mpirun -np $SLURM_NTASKS renumberMesh -parallel -overwrite -constant  > ./log/renumberMesh.log 2>&1
mpirun -np $SLURM_NTASKS patchSummary -parallel  > ./log/patchSummary.log 2>&1
mpirun -np $SLURM_NTASKS potentialFoam -parallel  > ./log/potentialFoam.log 2>&1

#------------------------------------------------------------------------------

mpirun -np $SLURM_NTASKS $(getApplication) -parallel   > ./log/$(getApplication).log 2>&1
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
