# Residuals

Usually residuals can be monitored via terminal live or in a log file afterwords.
However few solution are present if you want to generate a chart:

## With GNUPlot

GNU Plot is program for plotting mathematical expressions and data, to install it:

```sudo apt install gnuplot```

and creating a file: ```/system/residual``` called in ```/system/controlDict``` in this way

Then run:

```console
foamMonitor -l ./postprocessing/0/residuals
```

## With pyFoam

pyFoam is a python library to control OpenFOAM-runs and manipulate OpenFOAM-data.
Pyhton is usually already present in all GNU-Linux system and ready to use.


To install the programme with ```pip``` the package manger for pyhton projects you
need to run:
```console
pip install PyFoam
```

One recommended usage of these utilities would be to start a simulation with foamJob
and display the residuals with pyFoamPlotWatcher.py without interfering with the simulation.

```console
pyFoamPlotRunner.py \<solver\>
```