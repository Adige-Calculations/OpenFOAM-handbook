# fvOptions

This dictionary defines optional properties the case adopt, such as
porosity value, temperature limiters, etc.
The document once it is written does not require an utility to be applicable
because it is directly run by the solver.

## Limiting the temperature field

The following dictionary set the max and min temperature allowed in the domain.

```sh
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      fvOptions;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

limitT
{
    type       limitTemperature;
    min        300;
    max        460;
    selectionMode all;
}

//************************************************************************** //
```