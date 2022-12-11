# Residuals

The residuals are evaluated by substituting the current solution into the
equation and taking the magnitude of the difference between the left- and
right-hand sides of the system; it is also normalised to make it independent of the
scale of the problem being analysed. Consequently, before solving an
equation for a particular field, the initial residual is evaluated based
on the current values of the field. After each solver iteration the
residual is re-evaluated. To terminate the case, the initial residual of
the field equations must falls below user-specified threshold values.

## Check convergence
A simple trick to check the converge of the calculations properly, consits in checking
the \\( ν_{t} \\) convergence value since it is dependent from \\( k \\) and \\(  ε \\)
which both must converge to get a good \\( ν_{t} \\, hence it is one of the best indicator
of convergence.

## Graphically check convergence
Usually residuals can be monitored via terminal live or in a log file afterwords.
However few solution are present if you want to generate a chart:

### Charts with GNUPlot

GNU Plot is program for plotting mathematical expressions and data, to install it:

```sudo apt install gnuplot```

and creating a file: ```/system/residual``` called in ```/system/controlDict``` in this way

Then run:

```sh
foamMonitor -l ./postprocessing/0/residuals
```

### Charts with pyFoam

PyFoam is a python library to control OpenFOAM-runs and manipulate OpenFOAM-data.
A pyhton interpreter is usually already present in all GNU-Linux system, therefore 
to make the interpreter able to understand the programme you are going to run, the
installation of these libary must take place.
```pip``` the package manger for pyhton projects permits you install libraries present 
in the python official repo, to run it type as follows:

```sh
pip install PyFoam
```
One recommended usage of these utilities would be to start a simulation with foamJob
and display the residuals with pyFoamPlotWatcher.py without interfering with the simulation.

```sh
pyFoamPlotRunner.py <yourSolver>
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
