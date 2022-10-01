# External flow applications

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

To calculate k, the following equation can be used:


  $ k = \frac{3}{2}\left( \text{UI} \right)^{2} $

  $ ε = C_{\mu}\frac{\text{ρk}^{2}}{\mu}β ^{- 1}\ $

  $ ω = \frac{ρk}{\mu}\ β^{-1}\ $
