# Installation

The installation of OpenFoam® is possible through three different methods:

  - Installing the binaries and its shared libraries from a packages manager
  - Downloading and extracting an pre-compiled package from the OpenFoam® websites
  - Compiling the source code

## Suggested location

Wheater you do not use a package manger, you must choose where to install the software. It
is advised to create a ```/opt/OpenFOAM/``` directory if you are not backed up by a package
manager to avoid mistakes during future operations or updates.q You can create the directory
following:

```sh
sudo mkdir -p /opt/OpenFOAM
```

Where ```/opt``` stands for optional software on the GNU-Linux file system.

## Commodities

To edit text during local and remote session, a GUI will not be always available.
As a consequence software able to manage text efficiently on terminal are necessary.
It is adivised to deprecate ```nano``` and make use of the most advanced tool to edit text.

| Software name | Destination of use  |  Why |
| -----------   | ------------------- |------------------- |
|  micro        | Dictionary editing  | Easy to use and common shortcuts|
|  vim          | Code editing        | Tons extentions and good sintax highlighting|

### Install commodities

Debian system will install the software via:
```sh
sudo apt install micro vim
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
