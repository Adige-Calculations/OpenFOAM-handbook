# nut - \\( ν_{t} \\)

The entries for \\( ν_{t} \\) are type calculated because they come from ε and k
to calculate the field. Instead in the wall, you specify a wall function
for \\( ν_{t} \\), to modify the momentum equation for the cells adjacent to the
wall. The modification is that OpenFoam® calculates wall shear stress
from log-law for these cells and put it in their equations. OpenFoam®
does not use log-law directly to obtain next-to-the-wall cell velocities
but solves their equation in which the stress term is modified using
log-law.