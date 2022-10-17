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
