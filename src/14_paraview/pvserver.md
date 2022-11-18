# pvserver

pvserver is a server side utility that permit to use ParaView headless and in
parallel in a remote location, which we assume will have the capacity to
visuality heavy cases. To be sure that the connection server/client work
be sure to have the same verison of paraview installed in both the machines.
Best practice before starting to work with ```pvserver```, check that the port
used by the service (11111 by default) is free:

```console
netstat -na | grep 11111
```
If the port is listening, you can start the connection. For an accurate view of the listening ports and which programmes are
using those;

```console
sudo netstat -ltnp
```
the flags indicate respectively:
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
