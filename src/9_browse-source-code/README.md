# Browse Source Code

The best source of information is the source code and the Doxygen documentation.

## Source code

The source code of the solver (executable, not library) and governing equations solved are
described following the source code located in the directory ```$FOAM_SOLVERS```

Looking at the directory as example:

```sh
tree /opt/OpenFOAM/OpenFOAM-v2206/applications/solvers/heatTransfer/buoyantBoussinesqSimpleFoam
```

It will return the source code that builds the equation of your solver

```sh
.
├── buoyantBoussinesqSimpleFoam.C
├── createFields.H
├── Make
│   ├── files
│   └── options
├── pEqn.H
├── readTransportProperties.H
├── TEqn.H
└── UEqn.H
```

Other sources can be searched around. I.g: To find where the source code
for the boundary condition "slip" is located:

```sh
find $FOAM_SRC -name "*slip*"
```

Contoruring ```slip``` with ```*``` will make ```find``` able to find the word even inside a more complex title

## Doxigen

The directory ```$WM_PROJECT_DIR/doc``` contains the Doxygen documentation
of OpenFoam®. Before using the Doxygen documentation, you will need to
compile it. To compile the Doxygen documentation, from the terminal:

```sh
cd $WM_PROJECT_DIR
./Allwmake doc
```

> <b>Note</b>: You will need to install doxygen and graphviz/dot.

After compiling the Doxygen documentation,
you can use it by typing:

```sh
firefox file://$WM_PROJECT_DIR/doc/Doxygen/html/index.html
```

As a notice we say that the compilation is time consuming.

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
