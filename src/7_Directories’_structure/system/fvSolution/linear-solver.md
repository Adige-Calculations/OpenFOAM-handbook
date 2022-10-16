# linear solver

Matrix solver which works on algebraic system of shape Ax=b;
referring to the method of number-crunching to solve a matrix equation.
The linear solver stops if any one of the following conditions are
reached:

  - tolerance Define the exit criterion for the solver, it is the
    absolute difference between 2 consecutive iterations and must be low
    in steady state while coarser in transient simulation

  - relTol Define the exit criterion for the solver, on a relative
    difference of solution from 2 consecutive iteration (i.e. 0.1 is
    10%)

  - maxIter A maximum number of iterations at which the solver is
    stopped anyway 1000 as default

The solvers can be modified on the fly.
The GAMG solver (generalized geometric-algebraic multigrid solver), can often be the optimal choice for solving the pressure equation.

## SIMPLE solvers practice

### Pressure - Usual solver settings

For the pressure equation:

```c++
p
{
  solver GAMG;
  tolerance 1e-6;
  relTol 0.01;
  smoother GaussSeidel;
  nPreSweeps 0;
  nPostSweeps 2;
  cacheAgglomeration on;
  agglomerator faceAreaPair;
  nCellsInCoarsestLevel 1000;
  mergeLevels 1;
}
```
After a while it should be good practice to lower the relative tollerance to ```relTol: 0.0```` to let mamage the tollerance in an absolute criteria

### Velocity - Usual solver settings

```c++
p
{
solver GAMG;
tolerance 1e-6;
relTol 0.0;
smoother GaussSeidel;
nPreSweeps 0;
nPostSweeps 2;
cacheAgglomeration on;
agglomerator faceAreaPair;
nCellsInCoarsestLevel 1000;
mergeLevels 1;
}
```


## PISO & PIMPLE solvers practice
Remember, you must do at least one corrector step when using PISO solvers.
When you use the PISO and PIMPLE solvers, you also have the option to set the
tolerance for the final corrector step (.*Final).
By proceeding in this way, you can put all the computational effort only in the last
corrector step (.*Final).

```c++
p
{
  solver GAMG;
  tolerance 1e-04;
  relTol 0.01;
  smoother GaussSeidel;
  nPreSweeps 0;
  nPostSweeps 2;
  cacheAgglomeration on;
  agglomerator faceAreaPair;
  nCellsInCoarsestLevel 1000;
  mergeLevels 1;
}

pFinal
{
  solver GAMG;
  tolerance 1e-06;
  relTol 0.0;
  smoother GaussSeidel;
  nPreSweeps 0;
  nPostSweeps 2;
  cacheAgglomeration on;
  agglomerator faceAreaPair;
  nCellsInCoarsestLevel 1000;
  mergeLevels 1;
}
```