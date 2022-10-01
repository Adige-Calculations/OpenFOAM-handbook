# Useful command 

Grep will search word for you in selected documents or a list of them

```console
grep -w -R "car\_baseCase" \*
```
where -w stands for word and -R for research in subdirectories

Rename more than one file at once, extension included

```console
mmv '\*.STL' '\#1.stl'
```
To check running simulation written in a log file, it is possible to see
in terminal the live writing

```console
tail -f \<log.fileName\>
```
To copy a file in different directory, execute:

```console
ls -d processor\* | xargs -i cp -r 0.orig/\* ./{}/0
```
Run a GUI file manager from terminal (nautilus is the defult in GNOME
desktop envirnments - dolphin is the default for the KDE desktop environement) :

```console
nautilus . &
```
For replacing the text repetitively in file stream:

```console
find . -type f | xargs sed -i s/\<oldWord\>/\<newWord\>/g
```
To find Find the correct case in tutorial

```console
find $FOAM\_TUTORIALS -name controlDict | xargs grep -r \<word1\>
```

List controlDict files where word1 have been found