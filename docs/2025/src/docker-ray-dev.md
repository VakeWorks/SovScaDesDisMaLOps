# Docker for ray:dev

## Dockerfile for sovscadesdismalops

It is a good (optional) exercise for you to try to build the image locally on your system.

The `sovscadesdismalops` docker images are built locally in two steps:

1. First we build the docker image from scratch for ray using the modified script: [build-docker.sh](https://github.com/VakeWorks/SovScaDesDisMaLOps/blob/main/dev/build-docker.sh) 
    - see the comments in the first 20 lines of the script to build this `ray-project/ray:dev` image locally on your laptop
1. Next, use this [Dockerfile](https://github.com/VakeWorks/SovScaDesDisMaLOps/blob/main/dev/Dockerfile) to build your image for the workshop.
