# Installation via package manger

This is the simplest method to install software in GNU-Linux, however not all GNU-Linux distributions can take advantage of this method.
The following GNU-Linux distibution are supported:

- Debian/Ubuntu
- openSUSE
- CentOS/Fedora

To check the description of the package and the dependencies (other software needed to run OpenFoam®) the
software needs:

```sh
# It shows the information about OpenFOAM® from the OpenFOAM Foundation
apt show openfoam
```

While to point to the package distributed by the OpenCFD Ltd we must install an additional repository.

```sh
# Add the repository
curl https://dl.openfoam.com/add-debian-repo.sh | sudo bash

# Show the info for OpenFOAM® by OpenCFD Ltd
apt show openfoam2206-default
```

Then install it with super user privileges the package

```shell-session
sudo apt install openfoam2206-default
```
Then set the binaries/environment variable on the user workspace.
```sh
echo "source /usr/lib/openfoam/openfoam2206/OpenFOAM-v2206/etc/bashrc" >> ~/.bashrc
```

After the installation, it makes the usage of the software more practical
adding the tutorial functions to the user space in ~/.bashrc :

```sh
echo "source ${WM\_PROJECT\_DIR:?}/bin/tools/RunFunctions" >> ~/.bashrc
source ~/.bashrc
```
