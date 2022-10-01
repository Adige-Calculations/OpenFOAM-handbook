# Run in parallel

After having complete the decomposition of the domain through
system/decomposePar the following command does the same action, where
process is intended either as solver or mesher:

```console
mpirun -np \<cores\> \<process\> -parallel \> log.\<fileName\> &
```
```console
foamJob -parallel \<process\>
```
To take full advantage of the hardware, use the maximum number of
physical cores, remember to disable the hyperthreading in the machine.
The output of the previous command writes a log file that records
either events thatoccur in the macine to monitor the simulation.
```console
tail -f log.\<fileName\> Live scrolling
```
```console
tail -\<linesToDisplay\> log.\<fileName\> Static scrolling
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
pkill \<processName\>
```
if for some reason the process does not close, given the fact OpenFOAM processes
are not vital for the system you can force the kill using :
```console
kill -9 
```