# PETSc linear algebra solver

The [PETSc](https://petsc.org/) library can be used to resolve linear system of equations assembled by 
the OpenFOAM routines.

PETSc is installed (the target is the object ```libpetsc.so```) setting the library path (```LDPATH```) specifing the 
environment variables set to the petsc installation:

- <b>PETSC_DIR</b>
- <b>PETSC_ARCH</b>

The above env. variables are needed to compile and link the PETSc library.

### Compilation of the solver 

An OpenFOAM compatability layer must be created to allow the comunication from OpenFOAM to PETSc, 
hence a library must be generated:

```sh
cd $WM_PROJECT_DIR/module/external_solver
./Allwmake -config=openfoam
```

Then check the following 
 
```sh
foamHasLibrary -verbose petscFoam
```

And try out one of the prepared tutorial cases:

```sh
cd $WM_PROJECT_DIR/module/external_solver/tutorial
```

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