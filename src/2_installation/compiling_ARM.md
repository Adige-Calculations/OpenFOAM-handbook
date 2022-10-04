# Compiling the source code - ARM architecture

If the architecture of your machine differ from x86 such as a Raspberry or
an AWS ARM machine, you need to take few more steps. At first create a file
```etc/prefs.sh``` in the software root directory as shown:

```sh
cd /opt/OpenFOAM/OpenFOAM-v2206
echo "WM\_COMPILER=Gcc" > etc/prefs.sh
```

Then you have to change two files:

- ```./wmake/rules/linuxARM7Gcc/cOpt```
- ```./wmake/rules/linuxARM7Gcc/c++Opt)```

Substituting the option ```-mfloat-abi``` from ```softfp``` into ```hard``` as follows:

```sh
ls ./wmake/rules/linuxARM7Gcc/cOpt ./wmake/rules/linuxARM7Gcc/c++Opt | xargs sed s/softfp/hard/g
```

Then set the binaries/environment variables on the user workspace:
```sh
echo "source /opt/OpenFOAM/OpenFOAM-v2206/etc/bashrc" >> ~/.bashrc
```
After the installation, it makes the usage of the software more practical
adding the tutorial functions to the user space in ~/.bashrc :

```sh
echo "source ${WM\_PROJECT\_DIR:?}/bin/tools/RunFunctions" >> ~/.bashrc
source ~/.bashrc
```

Then start the compilation with:
```console
./Allwmake -j -s -l
```
the ```-j``` flag tells to the script to use all the available processors.

