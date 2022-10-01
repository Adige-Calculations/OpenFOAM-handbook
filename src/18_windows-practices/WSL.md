# Windows Subsystem for Linux


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
Then, once installed, The Linux root folder is in the Windows file
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
