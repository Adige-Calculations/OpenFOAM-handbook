# Parallel practices

After having complete the decomposition of the domain through
```decomposePar``` the following commands does the same action, where
process is intended either as solver or mesher:

```sh
mpirun -np <\cores\> <\solver\> -parallel > iterations.log &
```
```sh
foamJob -parallel <\solver\>
```
To take full advantage of the hardware, use the maximum number of physical cores, remember to disable the hyperthreading on the machine you are running.
The output of the previous command writes a log file that records either events thatoccur in the macine to monitor the simulation.
```sh
tail -f  iteration.log         #Live scrolling
```
```sh
tail -<\linesToDisplay\>  # Static scrolling
```
When the simulation is finished, all you time-step/iteration are in the
processor’s folder, to build a single case the following command it is
needed:
```sh
reconstructParMesh
reconstructPar
```
If you need to kill the process in parallel, check top at first and the
execute:
```sh
pkill <\processName\>
```
if for some reason the process does not close, given the fact OpenFOAM® processes
are not vital for the system you can force the kill using :
```sh
kill -9
```

## Parallelization issues

Given the case the ```0``` directory has not been set before the case decomposition,
what you can recover the mesh reconstructing it and then decompose it again with annex 
the ```0``` folder in place following this series of command at meshing done::

```sh
reconstructParMesh -constant
restore0Dir
decomposePar -force
```

When it is reconstructed only the mesh, and decomposed a second time to include the
0 directory, an error can occur when trying to reconstruct at the conclusion of the
case. A solution is to run:

```sh
reconstructParMesh -constant && reconstructPar -latestTime
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
