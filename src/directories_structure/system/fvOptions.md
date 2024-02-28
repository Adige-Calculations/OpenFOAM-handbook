# fvOptions

This dictionary defines optional properties the case adopt, such as
porosity value, temperature limiters, etc.
The document once it is written does not require an utility to be applicable
because it is directly read by the solver.

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
