# ParaView

To install it download the binary file from the ParaView website, un-tar
it. To call in the correct way ParaView, after having downloaded binary
file, put in your \~/.bashrc file the installation directory and source
the file after that, so it each time the terminal is called the path
will be registered and you can call ParaView with command line command;
ParaView.

```console
export PATH= \<installationPath>/ParaView-\<ParaViewVersion>/bin:${PATH}
```
and then make this modification active for the same session
```console
source ./bashrc
```
There is the need to create a dummy file in the working directory to
make ParaView be able to read the OpenFOAM® format.

```console
touch \<nameOfTheCase\>.foam
```
If ParaView is installed on Linux it is convenient call it with command

```console
paraview \<nameOfTheCase\>.foam &
```

The tag & keeps the program in background so you can continue to use the
same terminal page. In Windows Subsystem for Linux (WSL) it is enough
terminate the installation and run the executable;

```console
ParaView.exe \<nameOfTheCase\>.foam
```
When ParaView return errors in reading, it could be possible to solve it
changing the case format, convert the result of the simulation in VTK
format (Visualization Tool Kit), make it easier read the file and the
properties contained on in. The following command does this:

```console
foamToVTK
```

WARNING: If you use pressure-based solver as simpleFoam, it is
necessary multiply the pressure for the density\!\!\!

## Parallel visualization in local machine 

It is possible to parallelize the visualization task to deal with big
cases in your local machine, the simplest way is to enable the “Auto
MPI” mode through the following actions: 
Open ParaView → Edit → Settings → Enabled advanced options (the cogwheel up right) → Scroll
down (or search for) “Multicore Support” → Enable AutoMPI and set the
number of cores → restart ParaView.