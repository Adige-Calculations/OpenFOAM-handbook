# PETSc linear algebra solver

the [PETSc](https://petsc.org/) library must be used to resolve the linear system.

PETSc must be installed, with the library path (```LDPATH```) updated to include its shared object 
with the relative env variable set to the petsc installation:

- PETSC_DIR
- PETSC_ARCH

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
