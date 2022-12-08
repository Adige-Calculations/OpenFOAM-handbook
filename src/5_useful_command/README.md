# Useful command

A list comprised of a brief description of few usuefull UNIX command is given.


## ```grep```
It will search word patterns for you in selected documents or a list of them

```sh
grep -w -R "foo"
```
where -w stands for word and -R for research in subdirectories. It will search all the
file names that in which he finds a pattern (in this case: ```foo```).

## ```mmv```
Rename more than one file at once, extension included

```sh
mmv '\*.STL' '\#1.stl'
```

## ```tail```
To check running simulation written in a log file, it is possible to see
in terminal the live writing

```sh
tail -f  foo.log
```

## ```sed```
For replacing the text repetitively in file stream:

```sh
find . -type f | xargs sed -i s/<oldWord>/<newWord>/g
```

## Useful usage of the copy utility - ```cp```
To copy a file in different directory, execute:

```sh
ls -d processor* | xargs -i cp -r 0.orig/* ./{}/0
```

## Useful usage of ```find```

To find the correct case frame in tutorial
```sh
find $FOAM\_TUTORIALS -name controlDict | xargs grep -r foo
```

Which list controlDict files where the word ```foo``` have been found

If you want to know how the continuity errors are computed use find in this way:

```sh
$FOAM_SRC –iname *continuity*
```
and open any of the files.

## Run a GUI
Run a GUI file manager from terminal, ```nautilus``` is the defult in GNOME
desktop envirnments:

```sh
nautilus . &
```
Instead, ```dolphin``` is the default for the KDE desktop environement.

```sh
dolphin . &
```

This will open the file manager in the location you are on the terminal. The
flag ```&``` runs the process in background.

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
