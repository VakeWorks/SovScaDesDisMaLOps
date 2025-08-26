# Docker for ray:dev

## Docker images

- We will use the workshop's latest docker images built for the two main processor architectures.
- You can simply pull these docker images as follows:
  - For most modern mac laptops with silicon M1/M2/etc. on ARM 64 bit processors:
      ```sh
      docker pull vakeworks/sovscadesdismalops:dev-arm64
      ```
  - For most windows, linux and older mac laptops with INTEL x86/amd 64 bit processors:
      ```sh
      docker pull vakeworks/sovscadesdismalops:dev-amd64
      ```

## Dockerfile for sovscadesdismalops

It is a good (optional) exercise for you to try to build the image locally on your system.

The `sovscadesdismalops` docker images are built locally in two steps:

1. First we build the docker image from scratch for ray using the modified script: [build-docker.sh](https://github.com/VakeWorks/SovScaDesDisMaLOps/blob/main/dev/build-docker.sh) 
    - see the comments in the first 20 lines of the script to build this `ray-project/ray:dev` image locally on your laptop
1. Next, use this [Dockerfile](https://github.com/VakeWorks/SovScaDesDisMaLOps/blob/main/dev/Dockerfile) to build your image for the workshop.
