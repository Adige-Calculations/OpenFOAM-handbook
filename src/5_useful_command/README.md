# Useful command

A list and brief description of few UNIX command is given:

## ```grep```
It will search word patterns for you in selected documents or a list of them

```console
grep -w -R "foo"
```
where -w stands for word and -R for research in subdirectories. It will search all the
file names that in which he finds a pattern (in this case: ```foo```).

## ```mmv```
Rename more than one file at once, extension included

```console
mmv '\*.STL' '\#1.stl'
```

## ```tail```
To check running simulation written in a log file, it is possible to see
in terminal the live writing

```console
tail -f  foo.log
```

## ```sed```
For replacing the text repetitively in file stream:

```console
find . -type f | xargs sed -i s/</oldWord/>/</newWord/>/g
```

## Useful usage of ```cp```
To copy a file in different directory, execute:

```console
ls -d processor\* | xargs -i cp -r 0.orig/\* ./{}/0
```

## Useful usage of ```find```

To find Find the correct case in tutorial
```console
find $FOAM\_TUTORIALS -name controlDict | xargs grep -r foo
```

Which list controlDict files where the word ```foo``` have been found

## Run a GUI
Run a GUI file manager from terminal, ```nautilus``` is the defult in GNOME
desktop envirnments:

```console
nautilus . &
```
Instead, ```dolphin``` is the default for the KDE desktop environement.

```console
dolphin . &
```

This will open the file manager in the location you are on the terminal. The
flag ```&``` runs the process in background.