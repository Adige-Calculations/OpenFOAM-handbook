# Executing exclusively energy equations 

To avoid the resolution of the flow field, for example into a transient case
where the fluid will not change. You can insert the flag "frozenFlow" to jump this
step. 

```c++
SIMPLE
{
    momentumPredictor yes;
    nNonOrthogonalCorrectors 1;
    // Flag to indicate that the flow system of equations should not be evolved
    frozenFlow      true;
}
```

The fluid flow dynamic field (velocity and pressure) is instancaited by the first time step.

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
