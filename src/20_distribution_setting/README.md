# GNU-Linux distro settings

Several distribution may need some libraries, and correct callings to make the system working

## Fedora
To compile OpenFOAM in Fedora system, a particulary library must be exported in the exectution path:

```sh
export PATH=$PATH:/usr/lib64/openmpi/bin
source /usr/lib/openfoam/openfoam2112/OpenFOAM®-v2112/etc/bashrc
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
