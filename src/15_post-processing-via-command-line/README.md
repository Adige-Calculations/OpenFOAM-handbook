# Post processing via command line

An example to run the post process for y<sup>+</sup>sup>+</sup>

```console
\<solver\> -postProcess -func \<functionNameInControlDict\>
```
Every solver can be run with the -postProcess option, which only
executes post-processing, but with additional access to data available
on the database for the solver. To list the possible parameters to post
process:

```console
postProcess -list
```

For a run-processing, or a complicated function postprocess where is
necessary state different parameters. The simulation must be furnished
with the function object (Function objects are utilities to ease
workflow configurations and enhance workflows by producing additional
user-requested data both during runtime and postprocessing calculations,
typically in the form of additional logging to the screen, or generating
text, image, and field files) in controlDict as follow:

To manage in a simply way the function field already calculated through
controlDict, (already written in the data folder); the command line for
the post processing is the follow; this example is about averaging the
heat Transfer Coefficient.

```console
postProcess -func 'patchAverage(name=wall,heatTransferCoeff(T))'
```