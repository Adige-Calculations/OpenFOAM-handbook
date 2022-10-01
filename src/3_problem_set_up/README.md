# Case set up

Select an appropriate solver for the problem:
```shell-session
ls $FOAM\_SOLVERS
```
Once it is decided a solver, take the tutorial case, copy a suitable
tutorial to your working directory
```shell-session
cp -r $FOAM\_TUTORIALS/\<tutorial\> $FOAM\_RUN
```
Modify the tutorial, including geometry, meshing and problem setup. If
you need to set a specific directory which is not present in the
tutorial you have chosen, this utility will create the dictionary for
you:
```shell-session
foamGetDict \<dictionary you are searching\>
```
For instance:
```console
foamGetDict topoSetDict
```