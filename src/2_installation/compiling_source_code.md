# Compiling the source code - x86 architecture

The source code must be compiled in order to be used, it is usually retrieved using git
with the command:

```sh
git clone https://develop.openfoam.com/Development/openfoam.git /opt/OpenFOAM
git clone https://develop.openfoam.com/Development/ThirdParty-common.git /opt/OpenFOAM
```

The previous commands will install the source code and the third party
software in the installation directory ```/otp/OpenFOAM```, so the
binaries, libraries, and configuration will be in the same directory.
They will not be separated into different locations as a traditional
UNIX system would have them. To check if your system has an adequate
environment to start the installation run:

```sh
echo "source /opt/openfoam/OpenFOAM-v2206/etc/bashrc" >> ~/.bashrc
```
Check if the dowload was a success:

```shell-session
foamSystemCheck
```
If the system check did not produced error messages, then OpenFOAM® can
be compiled. This is done by executing the shell script ```Allwmake``` to
actually use the make utilities for automating the compilation of c written programme.
```sh
./Allwmake.
```
The installation script takes care of all required operations.
Compiling OpenFOAM® can be done by using more than one processor to save
time. In order to do this, an environment variable needs to be set
before running the script to make the programme

```sh
# This export an environment variable to run the compilation in 4 processors
export WM\_NCOMPPROCS =4
./Allwmake > installation.log
```
Or you can directly use all the avilable cores (using the ```-j``` flag) to proceed with the compilation:

```shell-session
./Allwmake -j -s -q -l > installation.log
```
After the source code has been compiled, makes the usage of the software more practical
adding the tutorial function to the user space in ~/.bashrc :

```sh
echo "source ${WM\_PROJECT\_DIR:?}/bin/tools/RunFunctions" >> ~/.bashrc
source ~/.bashrc
```
So, the OpenFoam® commands can be recognized directly in the terminal.

## HPC installation
In case of an HPC installation (the following one use an
AWS infrastructure with a SLURM scheduler) you can schedule
the installation with this shell script

```sh
#!/bin/bash
#SBATCH --job-name=OpenFOAM-compilation
#SBATCH --ntasks=36
#SBATCH --output=%x_%j.out
#SBATCH --partition=compute
#SBATCH --constraint=c5n.18xlarge

module load openmpi
source /fsx/openfoam/OpenFOAM-v2012/etc/bashrc
export WM_NCOMPPROCS=36
cd /fsx/OpenFOAM/openfoam/
./Allwmake > installation.log
```
This script uses 36 cores, correspondent to a 1 nodes since the HPC is composed by
nodes called c5n.18xlarge made by 36 cores each. The job should compile in few minutes.

The location of the source code is different because the software is installed on a
shared file system for distribution purpose.
