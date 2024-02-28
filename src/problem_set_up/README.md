# Case set up

The usual workflows to set up a case is to lay the foundation on similar tutorial.
Hence, you need to select an appropriate solver for the problem, a way for listing
the application areas is with:
```shell-session
ls $FOAM_SOLVERS
```
Once it is decided a solver, take a suitable tutorial case, copy it to your working directory.
```sh
mkdir -p $FOAM_RUN                # if you do not have a working directory
cp -r $FOAM_TUTORIALS/<\tutorial\> $FOAM_RUN
```
Modify the tutorial, including geometry, meshing and problem setup is crucial and often
you need to introduce a dictionary tat was not present in the original turotial file. The
following utility will create the dictionary for you:

```shell-session
foamGetDict <\dictionary you want in your case\>
```
For instance:

```sh
foamGetDict topoSetDict
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
