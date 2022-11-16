# Trouble shooting commons problem 

ParaView in latest version require drivers for OpenGL \> 3 and in
certain OS (such as CentOS 7) this is not compatible, hence if the
installed OpenGL driver are not supported, try to launch ParaView
telling to follow the MESA drivers:
```console
MESA_GL_VERSION_OVERRIDE=3.2 paraview
```
Otherwise:
```console
paraview –mesa
```
Same if you need to use ParaView in a headless mode and a graphic card
is not available, but you still want to render on the server. You can
build ParaView with these options to overtake the problem:

```console
cmake -GNinja -DVTK\_OPENGL\_HAS\_OSMESA=ON -DVTK\_USE\_X=OFF -DPARAVIEW\_USE\_QT=OFF ../\<locationParaViewSourceCode\>
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
