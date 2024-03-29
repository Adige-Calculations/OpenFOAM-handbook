# MPI (Message Passage Interface)

It is a standard, not an implementation. Hence it is not:

- a compiler
- a library
- a framework
- a programming language

It is the standard for paralleal computing in distributed system with distributed memory.
OpenMPI is one of its implementation (other flavours are avilable, i.g. Intel® MPI Library).

## OpenMPI

In general, Open MPI requires that its executables are in your PATH on every node that you will run on 
and if Open MPI was compiled as dynamic libraries (which is the default), the directory where its libraries 
are located must be in your LD_LIBRARY_PATH on every node.

Specifically, if OpenMPI was installed with a prefix of ```/opt/openmpi```, then the following should 
be in your PATH and LD_LIBRARY_PATH

- PATH:            /opt/openmpi/bin
- LD_LIBRARY_PATH: /opt/openmpi/lib

Depending on your environment, you may need to set these values in your shell startup files (e.g., .profile, .bashrc, etc.).

### Jobs launch with SLURM (Simple Linux Utility for Resource Management)

> Open MPI provides the commands ```mpirun``` and ```mpiexec``` to launch MPI jobs.

Open MPI supports launching parallel jobs in all three methods that Slurm supports:

- Launching via "salloc ..."
- Launching via "sbatch ..."
- Launching via "srun -n X my_mpi_application"

Specifically, you can launch MPI's mpirun in an interactive Slurm allocation (via the salloc command) or you can submit a 
script to Slurm (via the sbatch command), or you can "directly" launch MPI executables via srun.

OpenMPI automatically obtains both the list of hosts and how many processes to start on each host from Slurm directly. 
Hence, it is unnecessary to specify the --hostfile, --host, or -np options to mpirun. OpenMPI use Slurm-native mechanisms
to launch and kill processes (rsh and/or ssh are not required).

For example:

```sh
# Allocate a Slurm job with 4 nodes
salloc -N 4 sh
# Now run an Open MPI job on all the nodes allocated by Slurm
mpirun my_mpi_application
```

This will run the 4 MPI processes on the nodes that were allocated by Slurm. Equivalently, you can do this:

```sh
# Allocate a Slurm job with 4 nodes and run your MPI application in it
salloc -N 4 mpirun my_mpi_aplication
```

Or, if submitting a script like:

```sh
#!/bin/sh
mpirun my_mpi_application
```
with:

```sh
sbatch -N 4 my_script.sh
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
