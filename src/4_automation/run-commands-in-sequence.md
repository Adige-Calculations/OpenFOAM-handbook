# Execute a UNIX command sequence

The sequence of commands are a must to learn to be effective on the keyboard.

Command 2 (i.e. snappyHexMesh) will start only if command 1 (blockMesh) has succeeded:
```console
blockMesh && snappyHexMesh
```
Using the colon ```;``` permit to run command in sequence even if the precedent has failed.
```console
blockMesh; snappyHexMesh
```
Piping commands using ```|```. Feed the output of command 1 in command 2 as argument, as example:
```console
ls | grep foo
```
