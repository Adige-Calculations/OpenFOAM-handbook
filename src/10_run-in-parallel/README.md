# Parallel practices

After having complete the decomposition of the domain through
```decomposePar``` the following commands does the same action, where
process is intended either as solver or mesher:

```console
mpirun -np <\cores\> <\solver\> -parallel > iterations.log &
```
```console
foamJob -parallel <\solver\>
```
To take full advantage of the hardware, use the maximum number of physical cores, remember to disable the hyperthreading on the machine you are running.
The output of the previous command writes a log file that records either events thatoccur in the macine to monitor the simulation.
```console
tail -f  iteration.log         #Live scrolling
```
```sh
tail -<\linesToDisplay\>  # Static scrolling
```
When the simulation is finished, all you time-step/iteration are in the
processor’s folder, to build a single case the following command it is
needed:
```console
reconstructParMesh
reconstructPar
```
If you need to kill the process in parallel, check top at first and the
execute:
```console
pkill <\processName\>
```
if for some reason the process does not close, given the fact OpenFOAM® processes
are not vital for the system you can force the kill using :
```console
kill -9
```

## Parallelization issues

Given the case the ```0``` directory has not been set before the case decomposition,
what you can recover the mesh reconstructing it and then decompose it again with annex 
the ```0``` folder in place following this series of command at meshing done::

```console
reconstructParMesh -constant
restore0Dir
decomposePar -force
```

When it is reconstructed only the mesh, and decomposed a second time to include the
0 directory, an error can occur when trying to reconstruct at the conclusion of the
case. A solution is to run:

```console
reconstructParMesh -constant && reconstructPar -latestTime
```