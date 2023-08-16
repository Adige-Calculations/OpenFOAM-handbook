# Under-relaxation factors
Relaxation factors for under-relaxaing fields are specified within
```fvSolution.relaxationFactors.fields``` sub-dictionary, instead
equation under-relaxations factor are within a ```fvSolution.relaxationFactors.equations``` sub-dictionary. 

## SIMPLE

```c++
p 0.3;
U 0.7;
k 0.7;
omega 0.7;
```

## SIMPLEC

```c++
p 1;
U 0.9;
k 0.9;
omega 0.9;
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
  $("#footer").load("../../../footers/footer_third_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
