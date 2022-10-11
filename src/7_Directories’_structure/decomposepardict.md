# decomposeParDict

The dictionary decomposeParDict is read by the utility

```sh
decomposePar
```
The utility divides the domain in blocks which will
be solved by a single core each, hence the domain must be divided in the same parts as permitted parallel processes i.e. cores.

It is advised to use the ```schotch``` option
if the domain cannot be subdivided in sections with the same amourt of cells inside.
Use the command to overwrite an already decomposed case:

```console
decomposePar -force
```
## Example

```
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      decomposeParDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

numberOfSubdomains 16;                  // Must be to core numbers

method          hierarchical;           // schotch

coeffs                                  //
{                                       //
    n           (2 2 4);                //  No need if method is: schotch
}                                       //

```
