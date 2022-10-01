# Compile functionObjects from web

Once you are in possess of the file .C and .H of the function you want
to add. A new directory must add to the $FOAM\_SRC/functionObject/…/

For instance, ReynoldsNo folder and relative files has been transferred
to $FOAM\_SRC/functionObject/fields/

Inside this directory create an entrance in the file Make/fields like:
ReynoldsNo/ReynodsNo.C

Then run in ../Make the command
```console
wmake 
```
Remember to install the command make, if it is not installed:

```console
sudo apt-get install make
``` 