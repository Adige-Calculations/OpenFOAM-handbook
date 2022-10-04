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