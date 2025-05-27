# SovScaDesDisMaLOps

**Definition**:

**SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations

This repository is part of the needed preparation for [Wallenberg AI, Autonomous Systems and Software Program (WASP-AI)](https://wasp-sweden.org/) Summer School in 2025.

The ideas and concepts as well as working codes will be made availbale here for self-study and group-study for anyone who is interested in SovScaDesDisMaLOps.

## THM: Theoretical Modules

1. Data Engineering Sciences and Distributed Machine Learning Now (maths + stats + computing + economics ++ domain-expertise and entrepreneurship)
2. Laws of Capitalism, Corporate Jurisdictions, Statistical Contract Theory, Intellectual Property Laws in Sweden 
3. Abstract Machine Models, Work-Depth Model, Brent's Theorem, and Analysis of the Fastest Sorting Algorithm in Distributed Parallel Random Access Machine (DPRAM) model

## PRM: Practical Modules

1. Scaling Python with Ray in a Hurry (requirements: git or github account; docker desktop; up-to-date and secure laptop)
2. Deploying for Sovereign Operations in Scalable Data Engineering Sciences and Distributed Machine Learning Spaces.


### THM.1

### THM.2

### THM.3

### PRM.1

### PRM.2: Scaling Python with Ray in a Hurry

#### User Commands

Core commands needed to use this repository.

#### Peparation

Core commands to create this repository, including the addition of submodues.

```
# get source codes for scaling python with ray book from VakeWorks fork
git submodule add git@github.com:VakeWorks/scalingpythonml.git

# get source codes for ray from ray-project
git submodule add git@github.com:ray-project/ray.git
```

##### Launch ray locally on your laptop in docker:

- https://docs.ray.io/en/master/ray-overview/installation.html#launch-ray-in-docker
    - untested `.sh` execution `cd ray && ./build-docker.sh` failed with `=> ERROR [2/5] RUN <<EOF (#!/bin/bash...) ` on Tuesday 27 maj 2025 18:56:43 CEST
- Falling back on images dockerhub for now: https://hub.docker.com/r/rayproject/ray
    - `docker pull rayproject/ray` # pull docker imaeg for cpu from prebuilt official docker images
    - 
- Local Kuberenetes based KIND cluster for deployment: https://kind.sigs.k8s.io/
