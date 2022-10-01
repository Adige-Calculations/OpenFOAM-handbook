## Compiling for ARM architecture

Create a file \<installationPath\>/etc/prefs.sh in the installation
directory as shown:

```console
echo "WM\_COMPILER=Gcc" \> etc/prefs.sh
```

Change two files (cOpt and c++Opt) in wmake/rules/linuxARM7Gcc,
substituting the option -mfloat-abi=softfp into -mfloat-abi=hard

Then
```console
source \<installationPath\>/etc/bashrc
```
Then start the compilation with:
```console
./Allwmake -j -s -l
```
\-j flag stands for --> use all the processor available