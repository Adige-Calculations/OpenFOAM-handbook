To check the dependencies (other software needed to run OpenFoam®) the
suggested software and the description of the package:

```shell-session
apt show openfoam
```
Then install it

```shell-session
apt install \ *OpenFOAMVersion*
```

if the packages are not availble for your distribution, download the precompiled
binaries instead:

```console
wget https://dl.openfoam.com/source/v2206/OpenFOAM-v2206.tgz
wget https://dl.openfoam.com/source/v2206/ThirdParty-v2206.tgz
```
These command will download a .tar archive conatining the all necessary file to make
the software working.
