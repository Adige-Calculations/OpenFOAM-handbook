# fvSolution

The dictionary is divided in 3 parts:

- linear-solver
- solver
- under-relaxation factor

## Linear solver control

Linear solvers are a sets of algorithms to solve the following linear problems in matrix form:

\begin{equation}
\tag{1}
Ax=b
\end{equation}

The solver is said to have found a solution if any one of the following conditions are reached:

  - ```tolerance``` Define the exit criterion for the solver, it is the
    absolute difference between 2 consecutive iterations and must be low
    in steady state while coarser in transient simulation

  - ```relTol``` Define the exit criterion for the solver, on a relative
    difference of solution from 2 consecutive iteration (i.e. 0.1 is
    10%)

  - ```maxIter``` A maximum number of iterations at which the solver is
    stopped anyway 1000 as default

>> The solvers controls can be modified on the fly (when a simulation is running).


### Diagonal solver

If the matix coefficients have non-zeros values on its diagonal, therefore a set of explicit equations. The solution vector can be 
obtained inverting the stiffness matrix without incurring in relevant computational effort:

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

### Direct solvers

The following algoritms are direct methods, or method based on Gaussian elimination:

- ```smoothSolver```: Solver that uses a smoother.

The solvers that use a smoother require the choice of smoother to be specified as follow

- ```GaussSeidel``` Gauss-Seidel.
- ```symGaussSeidel``` symmetric Gauss-Seidel.
- ```DIC/DILU``` incomplete-Cholesky (symmetric), incomplete-LU (asymmetric).
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

###  Iterative solver (Minimization algorithms)

They are solver that start from a guess and they iteratively correct up to the respect 
of the equations of the system:

- ```PCG```/```PBiCG```: Preconditioned (bi-)Conjugate Gradient, with PCG for symmetric matrices, PBiCG for asymmetric matrices.
- ```PBiCGStab```: Stabilised preconditioned (bi-)conjugate gradient, for both symmetric and asymmetric matrices.
- ```GAMG```: Generalised Geometric-Algebraic Multi-Grid.

The ```GAMG``` solver can often be the optimal choice for solving the pressure equation.

> Preconditioners are useful in iterative methods to solve a linear system since the rate of convergence for most iterative 
> linear solvers increases because the condition number of a matrix decreases as a result of preconditioning. Preconditioned 
> iterative solvers typically outperform direct solvers, e.g., Gaussian elimination, for large, especially for sparse, matrices.

### Preconditioners

Preconditioning is typically related to reducing a condition number of the problem, via the application of a matrix transformation. 
The preconditioned problem is then usually solved by an iterative method. There are a range of options for preconditioning matrices:

- ```DIC/DILU```: diagonal incomplete-Cholesky (symmetric) and incomplete-LU (asymmetric)
- ```FDIC```: faster diagonal incomplete-Cholesky (DIC with caching, symmetric)
- ```GAMG```: geometric-algebraic multi-grid.
- ```diagonal```: diagonal preconditioning, not generally used
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

## Solver (coupling equations)

Whatever solver you use from above adopt a specific set of sequential algorithm such as semi-implicit 
method for pressure-linked equations (SIMPLE), pressure-implicit split-operator (PISO) or PIMPLE.
These sequential algorithms are iterative procedures for coupling equations for momentum and mass conservation, 
PISO and PIMPLE being used for transient problems and SIMPLE for steady-state.

All the algorithms solve the same governing equations, they differ in how they loop over the equations. 
The looping is controlled by input parameters that are listed below. They are set in a dictionary named after the algorithm:

  - ```nNonOrthogonalCorrectors```: used by all algorithms, specifies repeated
    solutions of the pressure equation, used to update the explicit
    non-orthogonal correction of the Laplacian term; typically set to 0
    (particularly for steady-state) or 1.

  - ```nCorrectors```: used by PISO, and PIMPLE, sets the number of times the
    algorithm solves the pressure equation and momentum corrector in
    each step; typically set to 2 or 3.

  - ```nOuterCorrectors```: used by PIMPLE, it enables looping over the entire
    system of equations within on time step, representing the total
    number of times the system is solved; must be and is typically set
    to 1, replicating the PISO algorithm.

  - ```momentumPredictor``` switch those controls solving of the momentum
    predictor; typically set to off for some flows, including low
    Reynolds number and multiphase.

### SIMPLE solvers practice

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
the tolerance as an absolute criteria. While for the velocity: 

```c++
U
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

### PISO & PIMPLE solvers practice

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

#### Addtional notes

Set to yes the momentumPredictor for high Reynolds flows, where convection dominates:

```c++
 momentumPredictor yes;
 ```

Recommended value is 1 (equivalent to PISO).
Increase to improve the stability of second
order time discretization schemes (LES
simulations). Increase for strongly coupled
problems.

```c++
nOuterCorrectors 1; 
```

Recommended to use at least 3 correctors.
It improves accuracy and stability. Use 4 or
more for highly transient flows or strongly
coupled problems.

```c++
 nCorrector 3; 
 ```

Recommend to use at least 1 corrector.
Increase the value for bad quality meshes.

```c++
 nNonOrthogonalCorrectors 1; 
```

The orthogonality correctors must be raised once the mesh starts to be highly orthogonal.

|Non-orthogonality       |between 70 and 85| between 60 and 70 | less than 60 |
|------------------------|-----------------|-------------------|--------------|
|nNonOrthogonalCorrectors| 3               |                  2|             1|

Flag to indicate whether to solve the turbulence on the final pimple iteration only. For Scale-Resolving 
Simulation (SRS) the recommended value is false (the default is true)

```c++
 turbOnFinalIterOnly false; 
```

## Under-relaxation factors

The relaxation factors for under-relaxaing the fields variable are specified within
```fvSolution.relaxationFactors.fields``` sub-dictionary, instead
equation under-relaxations factor are within a ```fvSolution.relaxationFactors.equations``` sub-dictionary. 

### SIMPLE

Usual set of parameters for under-relaxaing the problem using a SIMPLE scheme:

```c++
p 0.3;
U 0.7;
k 0.7;
omega 0.7;
```

### SIMPLEC

Usual set of parameters for under-relaxaing the problem using a SIMPLEC scheme:

```c++
p 1;
U 0.9;
k 0.9;
omega 0.9;
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
