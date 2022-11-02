# Docker
First create a docker file, which is a strictly a file named “Dockerfile”,
on which will be build a docker image that will become a container once is
running. To build the image from the Docker file use:

```console
docker build -t <nameOfTheImage> <DockerfileDirectory>
```
## System images
An image becomes a container when you execute it. Check the images that are present in your system after the build 
docker images

## Running the container
```console
docker run -ti -–rm <imageID>
```
Here's some more info on the flags:

  - ti       → make you access to the terminal
  - rm       →   remove the container once you exit
  - d        →  (deamon) run the container in detached mode (in the background)
  - p 80:80  →   port exposition

To see if the container is running check:

```console
docker ps
```
Then to start and/or stop the container run:

```console
docker stop <imageID>
```
```console
docker start <imageID>
```

## Mount a file system directory inside a docker container
Do not store your simulation data in the container. Instead let’s give our 
container access to just a little bit of our local filesystem. From your project
directory in a Windows environment, run:

```console
docker run -ti --rm -v ${PWD}:/data -w /data <imageID>
```
By adding the -v option we’re asking Docker to mount our current working directory
($PWD) as /data in the container. We’ve also added the -w switch to tell Docker
that we’d like to be in /data when the container starts.

## Creating an image from a container 
You can convert a container into an image by using the command
```console
docker commit 
```
## Delete the container
The following command will delete the container:
```console
docker rmi <imageID>
```