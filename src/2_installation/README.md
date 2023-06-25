# Installation

The installation of OpenFoam® is possible through three different methods:

  - Installing the binaries and correlated [dynamic libraries] from a packages manager
  - Downloading and extracting an pre-compiled package from the OpenFoam® websites
  - Compiling from the source code

In this chapter only pre-compiled installation steps will be covered. For further information on the compilation process refer to 
the relative chapter - [Compilation](../src/17_compile-functionobjects-from-web/README.md)

## Suggested location in the linux file system

If you do not use a package manger, you must choose where to install the software. It
is advised to create a ```/opt/OpenFOAM/``` directory if you are not backed up by a package
manager to avoid mistakes during updates. You can create the directory following:

```sh
sudo mkdir -p /opt/OpenFOAM
```

Where ```/opt``` stands for Optional software on file system hierarchy.

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
