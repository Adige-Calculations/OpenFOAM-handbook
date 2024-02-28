# Linear solver control

Linear solvers are sets of algorithms to solve linear problems as the following:

\begin{equation}
\tag{1}
Ax=b
\end{equation}

The solver stops if any one of the following conditions are reached:

  - ```tolerance``` Define the exit criterion for the solver, it is the
    absolute difference between 2 consecutive iterations and must be low
    in steady state while coarser in transient simulation

  - ```relTol``` Define the exit criterion for the solver, on a relative
    difference of solution from 2 consecutive iteration (i.e. 0.1 is
    10%)

  - ```maxIter``` A maximum number of iterations at which the solver is
    stopped anyway 1000 as default

>> The solvers controls can be modified on the fly (when a simulation is running).

## Diagonal solver

If the coefficient matrix only has values on its diagonal, the solution vector can be obtained inverting the matrix system using:

- ```diagonal```: a diagonal solver for explicit systems.

where:

\begin{equation}
\tag{2}
x = A^{-1}b
\end{equation}

Where the inverse of the diagonal matrix is simply:

\begin{equation}
\tag{2}
A^{-1}= \frac{1}{diagonal(A)}
\end{equation}

## Direct iterative solvers

The following algoritms are direct methods, or method based on Gaussian elimination:

- ```smoothSolver```: Solver that uses a smoother.

The solvers that use a smoother require the choice of smoother to be specified as follow

- ```GaussSeidel``` Gauss-Seidel.
- ```symGaussSeidel``` symmetric Gauss-Seidel.
- ```DIC/DILU: diagonal``` incomplete-Cholesky (symmetric), incomplete-LU (asymmetric).
- ```DICGaussSeidel``` diagonal incomplete-Cholesky/LU with Gauss-Seidel (symmetric/asymmetric).

When using the smooth solvers, the user can optionally specify the number of sweeps, by the ```nSweeps```
keyword, before the residual is recalculated. Without setting it, it reverts to a default value of 1.

The usage is reported below:

```sh
solver          smooth;
smoother        <smoother>;
relTol          <relative tolerance>;
tolerance       <absolute tolerance>;
```

##  Minimization algorithms - Iterative solver

The below are minimization algorithms, which they start from a guess and they iteratively correct up to the respect 
of the equations of the system:

- ```PCG```/```PBiCG```: Preconditioned (bi-)Conjugate Gradient, with PCG for symmetric matrices, PBiCG for asymmetric matrices.
- ```PBiCGStab```: Stabilised preconditioned (bi-)conjugate gradient, for both symmetric and asymmetric matrices.
- ```GAMG```: Generalised Geometric-Algebraic Multi-Grid.

The ```GAMG``` solver can often be the optimal choice for solving the pressure equation.

### Available preconditioners

There are a range of options for preconditioning of matrices in the conjugate gradient solvers.

- ```DIC/DILU```: diagonal incomplete-Cholesky (symmetric) and incomplete-LU (asymmetric)
- ```FDIC```: faster diagonal incomplete-Cholesky (DIC with caching, symmetric)
- ```diagonal```: diagonal preconditioning.
- ```GAMG```: geometric-algebraic multi-grid.
- ```none```: no preconditioning.

The pressure equation resolution usage is shown:

```sh
    p
    {
        solver          PCG;
        preconditioner  DIC;
        tolerance       1e-06;
        relTol          0.05;
    }

    pFinal
    {
        $p;
        relTol          0;
    }
```


# Coupling fluid dynamics problmes

Most fluid dynamics solver applications use either the pressure-implicit split-operator (PISO), the semi-implicit 
method for pressure-linked equations (SIMPLE) algorithms, or a combined PIMPLE algorithm. These algorithms are 
iterative procedures for coupling equations for momentum and mass conservation, PISO and PIMPLE being used for 
transient problems and SIMPLE for steady-state.

## SIMPLE solvers practice

### Pressure - Usual solver settings

For the pressure equation:

```c++
p
{
    solver GAMG;
    tolerance 1e-6;
    relTol 0.01;
    nPreSweeps 0;
    nPostSweeps 2;
    cacheAgglomeration on;
    agglomerator faceAreaPair;
    nCellsInCoarsestLevel 1000;
    mergeLevels 1;
}
```

After a while it should be good practice to lower the relative tollerance to ```relTol: 0.0``` to let mamage 
the tollerance in an absolute criteria

### Velocity - Usual solver settings

```c++
p
{
    solver GAMG;
    smoother <smoother>;
    tolerance 1e-6;
    relTol 0.0;
    nPreSweeps 0;
    nPostSweeps 2;
    cacheAgglomeration on;
    agglomerator faceAreaPair;
    nCellsInCoarsestLevel 1000;
    mergeLevels 1;
}
```

## PISO & PIMPLE solvers practice

You must do at least one corrector step when using PISO solvers.
When you use the PISO and PIMPLE solvers, you also have the option to set the
tolerance for the final corrector step (```*Final```).
By proceeding in this way, you can put all the computational effort only in the last
corrector step (```*Final```).

```c++
p
{
    solver GAMG;
    smoother <smoother>;
    tolerance 1e-04;
    relTol 0.01;
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
    smoother <smoother>;
    tolerance 1e-06;
    relTol 0.0;
    nPreSweeps 0;
    nPostSweeps 2;
    cacheAgglomeration on;
    agglomerator faceAreaPair;
    nCellsInCoarsestLevel 1000;
    mergeLevels 1;
}
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
  $("#footer").load("../../../footers/footer_third_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
