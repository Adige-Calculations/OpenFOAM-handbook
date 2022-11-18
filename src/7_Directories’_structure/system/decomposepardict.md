# decomposeParDict

The dictionary decomposeParDict is read by the utility

```sh
decomposePar
```
The utility divides the domain in blocks which will
be solved by a single core each, hence the domain must be divided in the same parts as permitted parallel processes i.e. cores.

It is advised to use the ```scotch;``` option
if the domain cannot be subdivided in sections with the same amourt of cells inside.
Use the command to overwrite an already decomposed case:

```console
decomposePar -force
```
## Example

```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      decomposeParDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

numberOfSubdomains 16;                  // Must be the same number you will during your simulation resolution

method          hierarchical;          
//method          scotch;

coeffs                                  //
{                                       //
    n           (2 2 4);                //  No need if method is: scotch
}                                       //

```
The more versatile but not very efficient division algorithm is instantiated like the following example:

```c++
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      decomposeParDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

numberOfSubdomains  4;

method          scotch;
// method          hierarchical;
// method          simple;
// method          manual;

coeffs
{
    n           (2 2 1);
    dataFile    "decompositionData";
}

scotchCoeffs
{
    //processorWeights ( 1 1 1 1 );
    //writeGraph  true;
    //strategy "b";
}

/*
constraints
{
    //- Keep owner and neighbour on same processor for faces in zones:
    faces
    {
        type    preserveFaceZones;
        zones   (heater solid1 solid3);
    }
}
*/


// ************************************************************************* //
```

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer_second_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
