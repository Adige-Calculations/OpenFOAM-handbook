# ParaView compilation

The build process follows the usual cmake scheme, from the root of your
source code:

```sh
mkdir build
cd build
cmake ..         # Generate the build instrutions 
cmake --build .  # Start the compilation process
```

## Paraview plugins 

If you need particular features from paraview it is necessaty to
build it from source. You'll need ```cmake``` to build the build instructions and ```ninja``` to execute the latter ones. 
The instruction present at this source are usefull for this scope: <https://vcg.iwr.uni-heidelberg.de/manual_source/>

## Dependencies

Assuming your system is Debian based the following libraries should be present in the system:

```sh
sudo apt-get install libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1
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
