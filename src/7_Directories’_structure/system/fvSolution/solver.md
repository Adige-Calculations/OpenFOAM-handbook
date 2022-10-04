# Solver


The solver explicit the algorithm the linear system will be arranged to
go towards convergence such as \<pressure-velocity coupling SOLVER\>
(i.e. SIMPLE, PISO or PIMPLE)

![Diagram Description automatically generated](media/image22.png)

Figure 2 - PIMPLE algorithm

All the algorithms solve the same governing equations, consequently they
differ in how they loop over the equations. The looping is controlled by
input parameters that are listed below. They are set in a dictionary
named after the algorithm

  - nNonOrthogonalCorrectors: used by all algorithms, specifies repeated
    solutions of the pressure equation, used to update the explicit
    non-orthogonal correction of the Laplacian term; typically set to 0
    (particularly for steady-state) or 1.

  - nCorrectors: used by PISO, and PIMPLE, sets the number of times the
    algorithm solves the pressure equation and momentum corrector in
    each step; typically set to 2 or 3.

  - nOuterCorrectors: used by PIMPLE, it enables looping over the entire
    system of equations within on time step, representing the total
    number of times the system is solved; must be and is typically set
    to 1, replicating the PISO algorithm.

  - momentumPredictor: switch those controls solving of the momentum
    predictor; typically set to off for some flows, including low
    Reynolds number and multiphase.