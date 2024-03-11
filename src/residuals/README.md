# Residuals

The residuals are evaluated by substituting the iterations' solution into the
theretical equation, taking out the non-zero result; it is also normalised 
to make it independent of the scale of the problem being analysed. Consequently, 
before solving an equation for a particular field, the initial residual is evaluated based
on the current values of the field. After each solver iteration the
residual is re-evaluated. To terminate the case, the initial residual of
the field equations should fall below user-specified threshold values.

#### Check convergence on turbulent flows

A simple trick to check the converge of the calculations properly, consits in checking
the \\( ν_{t} \\) convergence value since it is dependent from \\( k \\) and \\(  ε \\)
which both must converge to get a good \\( ν_{t} \\), hence it is one of the best indicator
of convergence.

## Convergence visualization

Residuals can be monitored via terminal live or in a log file afterwards. Nonetheless
solutions are present to generate charts:

#### GNUPlot

GNUPlot (```gnuplot```) is program for plotting mathematical expressions and data, to install it use the following:

```sh
sudo apt install gnuplot
```

Activate the object function in ```/system/controlDict```:

```c#
    ...
    functions
    {
        #includeFunc  residuals
        ...
    }
```

Then the simualtion can be started as:

```sh
foamInfo residuals
foamGet residuals
foamRun > log &
foamMonitor -l ./postprocessing/0/residuals
```

#### Manual GNUPlot file

A manual file for plotting the simualtion data follow:

```sh
set logscale y
set title "Residuals"
set ylabel 'Residual'
set xlabel 'Iteration'
plot "< cat log | grep 'Solving for Ux' | cut -d' ' -f9 | tr -d ','" title 'Ux' with lines,\
"< cat log | grep 'Solving for Uy' | cut -d' ' -f9 | tr -d ','" title 'Uy' with lines,\
"< cat log | grep 'Solving for Uz' | cut -d' ' -f9 | tr -d ','" title 'Uz' with lines,\
"< cat log | grep 'Solving for omega' | cut -d' ' -f9 | tr -d ','" title 'omega' with lines,\
"< cat log | grep 'Solving for k' | cut -d' ' -f9 | tr -d ','" title 'k' with lines,\
"< cat log | grep 'Solving for p' | cut -d' ' -f9 | tr -d ','" title 'p' with lines
pause 1
reread
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
