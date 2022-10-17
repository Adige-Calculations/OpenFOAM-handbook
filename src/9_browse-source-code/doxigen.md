# Doxigen

The directory ```$WM_PROJECT_DIR/doc``` contains the Doxygen documentation
of OpenFoam®. Before using the Doxygen documentation, you will need to
compile it. To compile the Doxygen documentation, from the terminal:

```console
cd $WM_PROJECT_DIR
./Allwmake doc
```

> <b>Note</b>: You will need to install doxygen and graphviz/dot.

After compiling the Doxygen documentation,
you can use it by typing:

```console
firefox file://$WM_PROJECT_DIR/doc/Doxygen/html/index.html
```
As a notice we say that the compilation is time consuming.
