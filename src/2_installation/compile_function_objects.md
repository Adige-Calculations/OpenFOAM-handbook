# Compile functionObjects

Once you are in possess of the source files (```.c``` and ```.h```) of the objectFunction.
A new directory must be added at ```$FOAM_SRC/functionObject/…/```.

> i.g. a Reynolds number custom functionObject files should be added in this plausible directory 

- ```$FOAM_SRC/functionObject/field/ReynoldsNo```

Then compiler instruction must be added in this case in:

``` sh
echo "ReynoldsNo/ReynodsNo.c" >>  $FOAM_SRC/functionObjects/field/Make/files
```

Then run from parent directory of the application you have changed (i.e. $FOAM_SRC/functionObject/field in this case) the command

```sh
wmake
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
