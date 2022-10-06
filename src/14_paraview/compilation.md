# ParaView compilation

Sometimes, if you need particular features from paraview it is necessaty to
build it from source. You'll need CMake and Ninja. Follow the instruction
present at this source to understand which features are availble.
<https://vcg.iwr.uni-heidelberg.de/manual_source/>

The build process follows the usual cmake scheme, from the root of your
source code:

```console
mkdir build
cd build
cmake ..
cmake --build .
```

Assuming you have a debian based distro on the server the following libraries
should be required

```console
sudo apt-get install libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5
lib32z1
```