# Compile functionObjects

Once you are in possess of the file .C and .H of the function you want
to add. A new directory must add to the $FOAM_SRC/functionObject/…/

For instance, ReynoldsNo folder and relative files has been transferred
to ```$FOAM_SRC/functionObject/fields/```

Inside this directory create an entrance in the file Make/fields like:
ReynoldsNo/ReynodsNo.C

Then run in ../Make the command
```console
wmake
```
Remember to install the command "make", if it is not installed proceed in this way:

```console
sudo apt-get install make
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
