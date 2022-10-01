## Compiling the source code - x86 architecture

The source code must be compiled in order to be used, it is usually retrieved using git
with the command:

```sh
git clone \<\>:

  - OpenFOAM-\<OpenFOAMVersion\>

  - ThirdParty-\<OpenFOAMVersion\>

```
```sh
git clone https://develop.openfoam.com/Development/openfoam.git
git clone 
```

Install the source code in the installation directory /otp/, so the
binaries, libraries, and configuration will be in the same directory.
They will not be separated into different locations as a traditional
UNIX system would have them. To check if your system has an adequate
environment to start the installation run:

```shell-session
source /opt/\<OpenFOAMInstallationPath\>/etc/bashrc
```
```shell-session
foamSystemCheck
```
If the system check did not produced error messages, then OpenFOAM can
be compiled. This is done by executing ./Allwmake. This is an
installation script that takes care of all required operations.
Compiling OpenFOAM can be done by using more than one processor to save
time. In order to do this, an environment variable needs to be set
before invoking ./Allwmake.

```shell-session
export WM\_NCOMPPROCS =4
```

then proceed with the compilation:

```shell-session
./Allwmake -j -s -q -l
```
If you have an HPC or you can schedule the installation with this bash
script

After the source code has been compiled, it is good practice add those
lines in  \~/.bashrc :

```shell-session
source \<installationDirectory\>/etc/bashrc
```
```shell-session
source ${WM\_PROJECT\_DIR:?}/bin/tools/RunFunctions
```
So, at the next start-up (source \~/.bashrc), the OpenFoam® commands
will be recognized in the terminal