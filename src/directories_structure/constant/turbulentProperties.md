# turbulentProperties

The current dictionary act as the selector for the turbulence model.
Consequent quanitie must be updated or introduced given the model you of turbulence you want to solve.

## RANS model (Reynolds Average Navier Stokes)

Usually three models are used and they can be specified in this way on ```constant/turbulenceProperties```:

```c++
simulationType      RAS;

RAS
{
    RASModel        kOmegaSST;  // or kEpsilon, kOmega, etc

    turbulence      on;

    printCoeffs     on;
}
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
