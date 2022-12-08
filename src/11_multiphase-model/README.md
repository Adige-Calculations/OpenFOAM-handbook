# Multiphase model

Multiphase models can put in place simulations with liquid-liquid, liquid-gas, gas-gas and fluid-solid interactions.
One of the more simple multiphase solver is:

``` sh
interFoam
```

Which solves the Navier Stokes equations for two incompressible, isothermal immiscible fluids. That means that the material properties are constant in the region filled by one of the two fluid except at the interphase. Transferrable, a similar pattern is present fot all the multiphase solver hence additional set-up must take place to deliver a simulation with more than one phase.

## Set-up

In a multiphase simulation you need to define the phase properties and its interaction through the ```constant``` directory.
Looking at the necessary file to run a more complex solver for liquid/gasseous interaction in a disperse phase like ```twoPhaseEulerFoam```.
The ```constant``` directory should look like this:

```sh
constant
├── phaseProperties
├── thermophysicalProperties.hydrogen
├── thermophysicalProperties.water
├── turbulenceProperties.hydrogen
└── turbulenceProperties.water
```

It this scenario we have the liquid phase as water, describing its theral behaviour in ```thermophysicalProperties.water```

```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      thermophysicalProperties.water;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

thermoType
{
    type            heRhoThermo;
    mixture         pureMixture;
    transport       const;
    thermo          hConst;
    equationOfState rhoConst;
    specie          specie;
    energy          sensibleInternalEnergy;
}

mixture
{
   equationOfState
    {
        rho             983.2;              // density     [kg/m^3]   at 60°C  
    }
    specie
    {
        molWeight       18.01528;           // water molecular weight   [g/mol]
    }
    thermodynamics
    {
        Cp              4190;               // Specific Heat at 90°C         [J/Kg K]
        Hf              0;                  // Heat of fusion - 0 in single phase
    }
    transport
    {
        mu              4.66E-04;           // dynamic viscosity at 90°C   [Kg/m s]
        Pr              2.98;               // Prandtl Number at 90°C      [nu/alfa] = [mu Cp/k] [-]    
    }

}


```


While the interaction between the two phases should look something like:
```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      phaseProperties;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

type isothermalPhaseModel ;
phases          (hydrogen water);

hydrogen
{
    diameterModel   isothermal;
    isothermalCoeffs
    {
        d0              3e-5;
        p0              1e5;
    }
    residualAlpha   1e-6;
}

water
{
    diameterModel   constant;
    constantCoeffs
    {
        d               1e-6;
    }
    residualAlpha   1e-6;
}

blending
{
    default
    {
        type            linear;
        maxFullyDispersedAlpha.hydrogen 0.7;
        maxPartlyDispersedAlpha.hydrogen 0.7;
        maxFullyDispersedAlpha.water 0.7;
        maxPartlyDispersedAlpha.water 0.7;
    }
}

sigma
(
    (hydrogen and water)     0.07
);

aspectRatio
(
    (hydrogen in water)
    {
        type            constant;
        E0              1.0;
    }

    (water in hydrogen)
    {
        type            constant;
        E0              1.0;
    }
);

drag
(
    (hydrogen in water)
    {
        type            SchillerNaumann;
        residualRe      1e-3;
        swarmCorrection
        {
            type        none;
        }
    }

    (water in hydrogen)
    {
        type            SchillerNaumann;
        residualRe      1e-3;
        swarmCorrection
        {
            type        none;
        }
    }

    (hydrogen and water)
    {
        type            segregated;
        residualAlpha   1e-6;
        m               0.5;
        n               8;
        swarmCorrection
        {
            type        none;
        }
    }
);

virtualMass
(
    (hydrogen in water)
    {
        type            constantCoefficient;
        Cvm             0.5;
    }

    (water in hydrogen)
    {
        type            constantCoefficient;
        Cvm             0.5;
    }
);

heatTransfer
(
    (hydrogen in water)
    {
        type            RanzMarshall;
        residualAlpha   1e-3;
    }

    (water in hydrogen)
    {
        type            RanzMarshall;
        residualAlpha   1e-3;
    }
);

lift
(
);

wallLubrication
(
);

turbulentDispersion
(
);

// Minimum allowable pressure
pMin            10000;

```

where ```sigma``` is the surface tension between the interfaces

If you change the name of the fluid in phases (water air); there is the
need change the extension of the name as well in 0 because the nomenclature
must be consistent:

```
0
├── alpha.hydrogen
├── p
├── p_rgh
├── Theta
├── T.hydrogen
├── T.water
├── U.hydrogen
└── U.water
```
Even remember that the first material that you define in the first row of this document will be taken as the first term of the VOF (volume of
fluid) equation.

> <b>Warning:</b> In fvSolutions miss the keyword
> cAlpha 1.0 to put in the section of alphaWater.*

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
