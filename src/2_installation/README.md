# Installation

The installation of OpenFoam® is possible through three differetn methods:

  - Directly installing the binaries from a packages manager

  - Extracting the already compiled package from the OpenFoam® websites

  - Compiling from the source code

## Suggested location in the linux file system

Wheater you do not use a package manger, you must choose where to install the software. It
is advised to create a ```/opt/OpenFOAM/``` directory if you are not backed up by a package
manager to avoid mistakes during future operations or updates. You can create the directory
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