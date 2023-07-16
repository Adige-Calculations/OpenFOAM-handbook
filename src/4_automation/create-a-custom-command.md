# Create a custom command

To create a personalized command (alias), if you are using bash as a OS shell like
in most of the UNIX like system, do:

```sh
echo "alias <\nameCommand\>=’<\list of command you want execute digiting
nameCommand\>" >> ~/.bashrc’
```
to write at the end of your shell config file the alias you prefer.
For example, a useful alias which create a dummy file with the name of
the directory and then open ParaView in series is declared as following:

```sh
alias paraview_openFoam ='touch "${PWD\#\#\*/}".foam && paraview "${PWD\#\#\*/}".foam
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
