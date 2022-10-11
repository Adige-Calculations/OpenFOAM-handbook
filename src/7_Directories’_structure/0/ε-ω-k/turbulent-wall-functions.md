# Turbulent Wall functions

Keeping the focus only in the treatment of the wall, the corresponding
wall functions exist:

- εWallFuncion for ε( (fixed value e=0 or better e=1e-8(?) for lowRe
calculations):

calculate (for each timestep) the first grid point value by using an
algebraic expression derived from the classical logarithmic law-of the
wall approach

- kqRWallFunction for k, q, R

in code: Boundary condition for turbulence k, Q, and R when using wall
functions. Simply acts as a zero-gradient condition. It appears to be
applicable down to yPlus ~ 1, but one should use a fixed value with k=0
or a very small value for y<sup>+</sup> <1)

\ omegaWallFunction for omega; Not really a wall function but the b.c.
defined by Menter for Omega, i.e. should be used always for kOmega
model, independent of y<sup>+</sup>)

omegawall=60\*nu/(β \*y+<sup>2</sup>), with nu=kinematic viscosity at the wall,
β =0.075 and y<sup>+</sup>normal distance between the first fluid node and the
nearest wall-> very large value for omega)

The "value" which is specified for the wall functions is only an initial
condition