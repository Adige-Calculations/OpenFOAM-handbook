# ParaView

To install it download the binary file from the ParaView website, un-tar
it. To call in the correct way ParaView, after having downloaded binary
file, put in your ```~/.bashrc``` file the installation directory and source
the file after that, so it each time the terminal is called the path
will be registered and you can call ParaView with command line command;
ParaView.

```sh
export PATH= <installationPath>/ParaView-<ParaViewVersion>/bin:${PATH}
```
and then make this modification active for the same session
```sh
source ./bashrc
```
There is the need to create a dummy file in the working directory to
make ParaView be able to read the OpenFOAM® format.

```sh
touch <nameOfTheCase>.foam
```
If ParaView is installed on GNU-Linux system, it is convenient call it with command

```sh
paraview <nameOfTheCase>.foam &
```

The tag & keeps the program in background so you can continue to use the
same terminal page. In Windows Subsystem for GNU-Linux (WSL) it is enough
terminate the installation and run the executable;

```sh
ParaView.exe <nameOfTheCase>.foam
```
When ParaView return errors in reading, it could be possible to solve it
changing the case format, convert the result of the simulation in the VTK
format (Visualization Tool Kit), it makes easier the manipulation the file and the
properties contained on in. The following command convert the format from the
OpenFOAM native one to VTK one:

```sh
foamToVTK
```

> WARNING: If you use pressure-based solver as simpleFoam, it is
necessary multiply the pressure for the density\!\!\!

## Parallel visualization in local machine

It is possible to parallelize the visualization task to deal with big
cases in your local machine, the simplest way is to enable the “Auto
MPI” mode through the following actions:

> paraview --> Edit --> Settings --> Enabled advanced options (the cogwheel up right) -->  Scroll down (or search for) “Multicore Support” --> Enable AutoMPI and set the number of cores --> restart ParaView.

## Huge data-set visualization
When the user cope with a huge amount of data, it is necessary the usage of a cluster to help manage 
the load and distribute it. However even a single machine user benefit from these techniques.

### NVIDIA IndeX™
A plug-in from NVIDIA called <b> NVIDIA IndeX™ </b> helps in resolving the problem.
It is a volume visualization tool, that takes advantage of the GPU’s to deliver real-time performance 
on large datasets by distributing visualization workloads across a GPU-accelerated system.
If you have installed ParaView using a binary package provided by Kitware, then the plugin
is already included and it is possible to load via:

> paraview --> Tools --> Manage Plugins --> pvNVIDIAIndex --> Load selected

## Trouble shooting commons problem 

ParaView in latest version require drivers for OpenGL => 3 and in
certain OS (such as CentOS 7) this is not compatible, hence if the
installed OpenGL driver are not supported, try to launch ParaView
telling to follow the MESA drivers:

```sh
MESA_GL_VERSION_OVERRIDE=3.2 paraview
```

Otherwise:

```sh
paraview –mesa
```

Same if you need to use ParaView in a headless mode and a graphic card
is not available, but you still want to render on the server. You can
build ParaView with these options to overtake the problem:

```sh
cmake -GNinja -DVTK\_OPENGL\_HAS\_OSMESA=ON -DVTK\_USE\_X=OFF -DPARAVIEW\_USE\_QT=OFF ../\<locationParaViewSourceCode\>
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
