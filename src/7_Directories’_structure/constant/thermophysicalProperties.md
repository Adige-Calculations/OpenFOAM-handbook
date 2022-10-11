# Thermophysical model

The thermophysicalProperties dictionary is read by any solver that uses
the thermophysical model library.

Types of thermo class

- hePsiThermo: General thermophysical model calculation based on compressibility ψ = 1/(RT) - Only gas
- heRhoThermo: General thermophysical model calculation based on density ρ. Gas, liquid, solids
- heSolidThermo: Only solids