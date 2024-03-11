# Post processing via command line

An example to run the post process for y<sup>+</sup>sup>+</sup>

```sh
<solver> -postProcess -func <functionNameInControlDict>
```
Every solver can be run with the -postProcess option, which only
executes post-processing, but with additional access to data available
on the database for the solver. To list the possible parameters to post
process:

```sh
postProcess -list
```

An example on how "system/controlDict" shoud be set up to read a function:

```c#
...

application     simpleFoam;

...

functions

{
    yPlusFunction
    {
        type            yPlus;
        libs            ("libfieldFunctionObjects.so");
        writeControl    writeTime;
        patches         (wall);
    }

}
```


## Postprocess utility

For a run-processing, or a complicated function postprocess where is
necessary state different parameters. The simulation must be furnished
with the function object (Function objects are utilities to ease
workflow configurations and enhance workflows by producing additional
user-requested data both during runtime and postprocessing calculations,
typically in the form of additional logging to the screen, or generating
text, image, and field files) in controlDict as follow:

```c++
...
functions    // sub-dictionary name under the system/controlDict file
{
    <userDefinedSubDictName1>
    {
        // Mandatory entries
        type                <functionObjectTypeName>;
        libs                (<libType>FunctionObjects);

        // Mandatory entries defined in <functionObjectType>
        ...

        // Optional entries defined in <functionObjectType>
        ...

        // Optional (inherited) entries
        region              region0;
        enabled             true;
        log                 true;
        timeStart           0;
        timeEnd             1000;
        executeControl      timeStep;
        executeInterval     1;
        writeControl        timeStep;
        writeInterval       1;
    }

    <userDefinedSubDictName2>
    {
        ...
    }
    ...
}
```

To manage in a simply way the function field already calculated through
controlDict, (already written in the data folder); the command line for
the post processing is the follow; this example is about averaging the
heat transfer coefficient.

```sh
postProcess -func 'patchAverage(name=wall, heatTransferCoeff(T))'
```

While to extract the pressure drop, run a command similar to the follow one:

```sh
postProcess -func 'patchAverage(name=inlet, p)'
```

once it is know the pressure of the outlet you can subract it and obtain the delta pressure.

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
