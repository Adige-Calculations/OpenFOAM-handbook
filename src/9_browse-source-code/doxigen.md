# Doxigen

The directory $WM\_PROJECT\_DIR/doc contains the Doxygen documentation
of OpenFoam® ). Before using the Doxygen documentation, you will need to
compile it. To compile the Doxygen documentation, from the terminal:

```console
cd $WM\_PROJECT\_DIR
./Allwmake doc
```

Note: You will need to install doxygen and graphviz/dot. After compiling
the Doxygen documentation you can use it by typing:

```console
firefox file://$WM\_PROJECT\_DIR/doc/Doxygen/html/index.html
```
The compilation is time consuming.
