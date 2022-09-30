These are script files, for running all the commands related to the
case. You can open it using any editor and see the commands in it.
Tanking as an example the native bash script often present in tutorial
cases:

```console
./Allrun
```
It will run all the command necessary to run the tutorial

```console
./Allclean 
```
It will run all the command necessary to clean the tutorial.
To write you bash script, start a new file with the notation:

```sh
#!/bin/bash 
```
in the first row and then followed by the command you want to execute
Elevate the file permission adding execution permission through

```console
chmod +x \<fileName\>
```
For running your bash script, type:
```console
./\<fileName\>