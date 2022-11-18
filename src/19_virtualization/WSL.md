# Windows Subsystem for GNU-Linux

OpenFoam<sup>®</sup> can run on version 2 of WSL few installation notes,
run in PowerShell as admin for the enabling a necessary Windows feature:

```console
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform
/all /norestart
```
The proceed with the installation:
```console
wsl –install
```
Then, once installed, The GNU-Linux root folder is in the Windows file
explorer in:

```console
\\wsl$\Ubuntu-20.04\
```
Or whatever distribution you have.


## WSL GUI in Windows
To lunch GUI programmes via WSL the following actions must take place:
Install an Xserver like VcXsrv, download from
[https://sourceforge.net/projects/vcxsrv/ 782](https://sourceforge.net/projects/vcxsrv/)
and install/start it. Specifying the server numer to be ‘0’ on the first
screen and also allow public access

Disable Windows Defender Firewall for Guest or public Network

In WSL edit the file
``` console
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0 >> ~/.bashrc
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
