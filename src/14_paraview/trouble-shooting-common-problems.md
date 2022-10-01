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