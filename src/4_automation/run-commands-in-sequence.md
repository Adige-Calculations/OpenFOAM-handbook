## Run commands in sequence 

Sequence of commands Command 2 will start only if command 1 has succeeded:
```console
\<Command1\> && \<Command2\>
```
Piping commands → The output of Command 1 will feed Command 2 as argument
```console
\<Command1\> | \<Command2\>
```
Using ; permit to run command in sequence even if the precedent fail
```console
\<Command1\>; \<Command2\>
```