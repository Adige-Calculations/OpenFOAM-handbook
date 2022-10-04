# Cluster practice

Check what module of OpenFoam® is installed
```console
module avail
```
the module command modifies your environment so that the path and other
variables are set and you can use the selected program. Before a series
of command starts inside the shell script it is necessary to prepare the
environment, this is an example:
```bash
#!/bin/bash
#SBATCH --job-name=OF-Job
#SBATCH --ntasks=36
#SBATCH --output=%x_%j.out
#SBATCH --constraint=c5.18xlarge

#------------------------------------------------------------------------------

module load openmpi                                      # Module upload
source /fsx/programs/OpenFOAM®/OpenFOAM®-v2112/etc/bashrc  # Source OpenFOAM® bashrc command
source ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Source run functions

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