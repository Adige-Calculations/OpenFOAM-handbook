# Case set up

The usual workflows to set up a case is to lay the foundation on similar tutorial.
Hence, you need to select an appropriate solver for the problem, a way for listing
the application areas is with:
```shell-session
ls $FOAM_SOLVERS
```
Once it is decided a solver, take the tutorial case, copy a suitable
tutorial to your working directory
```shell-session
cp -r $FOAM_TUTORIALS/<\tutorial\> $FOAM_RUN
```
Modify the tutorial, including geometry, meshing and problem setup is crucial and often
you need to introduce a dictionary tat was not present in the original turotial file. The
following utility will create the dictionary for you:
you:

```shell-session
foamGetDict <\dictionary you want in your case\>
```
For instance:
```console
foamGetDict topoSetDict
```