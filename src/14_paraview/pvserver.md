# pvserver



Pvserver is the programme that permit to use ParaView headless and in
parallel in a remote location, which we assume will have the capacity to
visuality heavy cases. To be sure that the connection server/client work
be sure to have the same verison of paraview installed in both the machines.

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

Best practice before starting to work with pvserver, check that the port
used by the service (11111 by default) is free

```console
netstat -na | grep 11111
```
If the port is listening, you can start the connection.
For an accurate view of the listening ports and which programmes are
using those;

```console
sudo netstat -ltnp
```
  - l: display only listening sockets
  - t: display TCP connection
  - n: display addresses in a numerical form
  - p: display process ID/ Program name



### Server/Client connection

<table>
<thead>
<tr class="header">
<th><strong>Server side </strong></th>
<th><strong>Client side </strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>On the terminal execute:</p>
<p>mpiexec -np 4 pvserver</p>
<p>This command will establish a connection though the port 11111 (default for ParaView), if you want to specify a different port</p>
<p>mpiexec -np 4 pvserver --server-port=&lt;<strong>portNumber</strong>&gt;</p>
<p>On the terminal, get your IP address:</p>
<p>hostname -i</p>
<p>And your client host name:</p>
<p>hostname -a</p></td>
<td><p>In ParaView go on:</p>
<p>File → Connect → Add Server</p>
<p>And fulfil the fields in this way</p>
<table>
<thead>
<tr class="header">
<th>Name</th>
<th>&lt;<strong>serverPublicIPAddress</strong>&gt;</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Server type</td>
<td>Client/Server</td>
</tr>
<tr class="even">
<td>Port</td>
<td>11111</td>
</tr>
</tbody>
</table>
<table>
<tbody>
<tr class="odd">
<td>Configure</td>
<td>Manual startup</td>
</tr>
</tbody>
</table>
<p>Port 11111 is the default TCP port for the ParaView connection, if this port is occupied from another service you can set up another port accordingly with the server setting.</p>
<table>
<tbody>
<tr class="odd">
<td>Connect</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>
