# Multipass

If you need to use VMs in your machine together with Docker, WSL could
not be the best choice since it can create dependencies problem, and one
of the virtual environment above citated will not work at the current
time. A solution for the coexistence of container and VM in your machine
is the usage of Multipass

Multipass is a VM supplied by Canonical which is powerful and contain
systemd. To start a multipass instance run on the Power Shell:

multipass launch -v -c 18 -d 64G -m 40G –-name \<nameOfTheInstance\>

Few comments on the flags:

  - c → CPU cores
  - d → Disk space
  - m → Memory
  - v → Verbose

To mount a part of your file system in your virtual multipass machine
do:
```console
multipass mount 'D:\\' \<nameOfTheInstance\>:
```
