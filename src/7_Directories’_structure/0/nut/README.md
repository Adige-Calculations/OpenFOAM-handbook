# nut - \\( ν_{t} \\)

The entries for \\( ν_{t} \\) are type calculated because they come from ε and k
to calculate the field. Instead in the wall, you specify a wall function
for \\( ν_{t} \\), to modify the momentum equation for the cells adjacent to the
wall. The modification is that OpenFoam® calculates wall shear stress
from log-law for these cells and put it in their equations. OpenFoam®
does not use log-law directly to obtain next-to-the-wall cell velocities
but solves their equation in which the stress term is modified using
log-law.

## Turbulent viscosity wall functions

The choice of wall function model is specified through the turbulent
viscosity field  \\( ν_{t} \\) in the 0/nut dictionary by the nutxxxxxx
wall functions:

  - nutWallFunction seems to be the most basic wall function without
    further requirements: high-Re wall-function based on k.

  - nutkWallFunction standard for k-ε/k-ω, it calculates the turbulent
    viscosity in the first node point based on the logarithmic law based
    on the k value close to the wall

  - nutUWallFunction: in comparison to nutkWallFunction it calculates the y<sup>+</sup>sup>+</sup> yPlus value based on the velocity close to the
    wall

  - nutUSpaldingWallFunction standard wall function for the Spallart
    Allmarras turbulence model, called nutSpalartAllmarasWallFunction, continuous wall-function which should cover the complete y<sup>+</sup> range from O(1) to somewhere of O(10). Might be the best choice (together with low Re k-ε, k-ω, or SA, when y<sup>+</sup> varies for different parts of the wall.

  - nutLowReWallFunction (code comment: "Sets \\( ν_{t} \\) to zero and provides an access function to calculate y<sup>+</sup>."):
