# GNU-Linux distro settings

Several distribution may need some libraries, and correct callings to make the system working

## Fedora
To compile OpenFOAM in Fedora system, a particulary library must be exported in the exectution path:

```sh
export PATH=$PATH:/usr/lib64/openmpi/bin
source /usr/lib/openfoam/openfoam2112/OpenFOAM®-v2112/etc/bashrc
```
