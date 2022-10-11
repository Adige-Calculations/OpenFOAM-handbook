# Multiphase model

One of the more simple multiphase solver is:

``` sh
interFoam
```

In a multiphase simulation when you define the properties of the
interested fluids in ```constant/transportProperties```

sigma: is the surface tension between at the interface

If you change the name of the fluid in phases (water air); there is the
need change the extension of the name as well in

0/alpha.<\nameOfTheFluid\>.

Even remember that the first material that you define in the first row of this document will be taken as the first term of the VOF (volume of
fluid) equation.

> <b>Warning:</b> In fvSolutions miss the keyword
> cAlpha 1.0 to put in the section of alphaWater.*
