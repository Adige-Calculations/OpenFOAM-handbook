# ε, ω, k

An estimation of the turbulent mainstream quantities should take place
to have a stable solver.

## Turbulent external flow approximations

External flows can be a bit tricky to approximate because it is hard to
evaluate the flow downstream considering anything that could have
affected the turbulence. This could be other objects, convection over
land or the position of the domain in a boundary layer. A good technique
for approximation turbulence is by using the Turbulent Viscosity
Ratio—the ratio between molecular viscosity and turbulent viscosity.
This ratio can be used along with the Turbulence Intensity, freestream
velocity and molecular viscosity to determine k, ε and ω using the
following technique. To start the calculation, the Turbulent Intensity
I, and Viscosity Ratio β need to be approximated by using the table
below.

| Turbulence | Reynolds number | Turbulent Intensity  | 
|------------|-----------|-----------|
| Low turbulence | 3000 < Re < 5000 | 1% |
| Med turbulence |5000 < Re < 15000 | 1-5% |
| High turbulence |15000 < Re < 20000 | 5-20% |
| High turbulence | Re > 100000 | 5-20% |

To calculate k, the following equation can be used:


  \\[ k = \frac{3}{2}\left( \text{UI} \right)^{2} \\]

  \\[ ε = C_{\mu}\frac{\text{ρk}^{2}}{\mu}β ^{- 1}\ \\]

  \\[ ω = \frac{ρk}{\mu}\ β^{-1}\ \\]

## Turbulent internal flow approximations

For a fully developed inlet flow, approximating turbulent boundary
conditions can be extrapolated using the Reynolds number *Re* to
determine the turbulent intensity *I* to define the intensity length
scale *l*, the required turbulent boundary conditions can be calculated.

\\[ I = 0.16 \ Re_L ^{-1/8} \\]

This can be used to calculate a mean approximation for the turbulent
boundary conditions

\\[ k = \frac{3}{2} U I^{2} \\]

\\[ ε = C_{\mu}\frac{k^{\frac{3}{2}}}{l} = C_{\mu}\frac{k^{\frac{3}{2}}}{0.07L} \\]

\\[ ω = \frac{\varepsilon}{kC_{\mu}}\  \\]

## Turbulent Wall functions

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
