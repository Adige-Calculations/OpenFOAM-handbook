# Docker

Docker is an open-source software project automating the deployment of applications inside software containers.
To visualise how many imagesyou have in your system run:

```sh
docker images
```

It works with images and container, the main difference between this two is:

- An image is piece of memory with the os and applicaiton data inside
- A container instead is a running image

## System images
An image becomes a container when you execute it. Check the images that are present in your system after the build
docker images, the command to build an image is:

```sh
docker build <DirectoryWhereTheDockerfileIsLocated>
```

First create a docker file, which is a file named ```Dockerfile``` with a content similar to the followng
script snippet (depending on your esigence) on which will be build a docker image that will become a container once is
running.

```sh
# Start from the official Ubuntu official image in DockeHub (last LTS version)
FROM ubuntu:latest    

# Setting the environment variable 
ENV DEBIAN_FRONTEND=noninteractive

# Install any extra things we might need
RUN apt-get update \
	&& apt-get install -y micro curl sudo bc python3 

# Create a new user called of-user
RUN useradd --user-group --create-home --shell /bin/bash of-user ;\
	echo "of-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install OpenFOAM v2112 (without ParaView) including configuring for use by user=of-user plus an extra environment variable to make OpenMPI play nice
RUN curl -s https://dl.openfoam.com/add-debian-repo.sh | bash ;\
	apt-get install -y openfoam2112 ;\
	rm -rf /var/lib/apt/lists/* ;\
	echo "source /usr/lib/openfoam/openfoam2112/etc/bashrc" >> ~of-user/.bashrc ;\
	echo "export OMPI_MCA_btl_vader_single_copy_mechanism=none" >> ~of-user/.bashrc;

#   Set the default container user to of-user
USER of-user

#ENTRYPOINT ["/data/run.sh"]
```
To build the image from the ```Dockerfile``` use:

```sh
docker build -t <nameOfTheImage> <DockerfileDirectory>
```

## Running the container
Running the container means that the docker file will be read and executed, the execution
can be modified by the flags that follows the utility such as:

```sh
docker run -ti -–rm <imageID>
```
Here's some more info on the flags:

  - ti       →  make you access to the terminal
  - rm       →  remove the container once you exit
  - d        →  (deamon) run the container in detached mode (in the background)
  - p 80:80  →  port exposition, the local OS can connect to the docker image via port 80

To see if the container is running check:

```sh
docker ps
```
Then to start and/or stop the container run the following self explatory commands:

```sh
docker start <imageID>
docker stop <imageID>
```

### Mount a file system directory inside a docker container
Do not store your simulation data in the container. Instead let’s give our 
container access to just a little bit of our local filesystem. From your project
directory in a Windows environment, run:

```sh
docker run -ti --rm -v ${PWD}:/data -w /data <imageID>
```
By adding the -v option we’re asking Docker to mount our current working directory
($PWD) as /data in the container. We’ve also added the -w switch to tell Docker
that we’d like to be in /data when the container starts.

## Creating an image from a container 
You can convert a container into an image by using the command

```sh
docker commit 
```
## Delete container
The following command will delete the container:

```sh
docker ps			 	   # To visualise them
docker rmi <imageID>
```

Or you can delete all of them piping two commands:
```sh 
docker rm -vf $(docker ps -aq)
```


## Delete images
To delete the images that does not run a container above them run;

```
docker images  				# To visualise them
docker image rm <imageID>
```
Or you can delete all of them piping two commands:

```sh
docker rmi -f $(docker images -aq)
```

## Reclaim space from machine
Docker saves container chaces on ```var/lib/docker```, this can clog a machine that
does not have storage available. A quick solution is to run the following command to clean the system cache:
```sh
docker system prune -a -f
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
