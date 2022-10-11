# turbulentProperties

The current dictionary contains the adoction control of turbulence models.
Consequent quanitie must be updated or introduced given the model you of turbulence you want to solve.

## RANS model (Reynolds Average Navier Stokes)

Usually three models are used and they can be specified in this way on ```constant/turbulenceProperties```:

```c++
simulationType      RAS;

RAS
{
    RASModel        kOmegaSST;  // or kEpsilon   // or kOmega

    turbulence      on;

    printCoeffs     on;
}
```