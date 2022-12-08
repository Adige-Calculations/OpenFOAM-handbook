# Precompiled binaries download
If the packages are not availble for your distribution, download the precompiled binaries instead:

```sh
wget https://dl.openfoam.com/source/v2206/OpenFOAM-v2206.tgz -P /opt/OpenFOAM
wget https://dl.openfoam.com/source/v2206/ThirdParty-v2206.tgz -P /opt/OpenFOAM
```
These command will download a .tar archive conatining the all necessary file to make the software working on the ```opt/OpenFOAM``` directory.
It is advised to use this directory if you are backed up by a package manager to avoid mistakes during future operations or updates.
Next step is to untar these archive with:

```sh
cd /opt/OpenFOAM
tar -xvf OpenFOAM-v2206.tgz
tar -xvf ThirdParty-v2206.tgz
```
Then set the binaries/environment variables on the user workspace:
```sh
echo "source /opt/OpenFOAM/OpenFOAM-v2206/etc/bashrc" >> ~/.bashrc
```
After the installation, it makes the usage of the software more practical
adding the tutorial functions to the user space in ~/.bashrc :

```sh
echo "source ${WM\_PROJECT\_DIR:?}/bin/tools/RunFunctions" >> ~/.bashrc
source ~/.bashrc
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
