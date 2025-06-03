# SovScaDesDisMaLOps

**Definition**:

**SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations

This repository is part of the needed preparation for [Wallenberg AI, Autonomous Systems and Software Program (WASP-AI)](https://wasp-sweden.org/) Summer School in 2025.

The ideas and concepts as well as working codes will be made availbale here for self-study and group-study for anyone who is interested in SovScaDesDisMaLOps.

## THM: Theoretical Modules

1. Data Engineering Sciences and Distributed Machine Learning Now 
2. Laws of Capitalism, Statistical Contract Theory, Intellectual Property Laws in Sweden, Corporate Jurisdictions and Sovereignty  
3. Abstract Machine Models, Work-Depth Model, Brent's Theorem, and Analysis of the Fastest Sorting Algorithm in Distributed Parallel Random Access Machine (DPRAM) model

## PRM: Practical Modules

1. Scaling Python with Ray in a Hurry (requirements: git or github account; docker desktop; up-to-date and secure laptop)
2. Deploying for Sovereign Operations in Scalable Data Engineering Sciences and Distributed Machine Learning Spaces.


### THM.1 Data Engineering Sciences and Distributed Machine Learning Now

- Data Engineering Sciences and Distributed Machine Learning today is (matematics + statistics + computing + micro-economics ++ domain-expertise and entrepreneurship)

### THM.2. Laws of Capitalism

- VIEW: [Laws of Capitalism Playlist](https://youtube.com/playlist?list=PLmtuEaMvhDZZ34Ltok-LB5tpfus2_6xW8&feature=shared) [140 minutes]
    - The laws of capitalism have elevated the interests of the few above that of the many, but we can rewrite the code and restore balance to society. In this series, Professor Katharina Pistor (Columbia Law School) breaks down the history, process, institutions, and participants involved in the legal coding of capital. She shows us how private actors have harnessed social resources to accumulate wealth, generating not only economic inequality, but inequality in law. Enabling them to opt out of jurisdictions, restrict governmental policy, and erode democracy. Learn more at http://lawsofcapitalism.org/

- READ: [*The Code of Capital: How the Law Creates Wealth and Inequality*](https://press.princeton.edu/books/hardcover/9780691178974/the-code-of-capital), Katharina Pistor, Princeton University Press, 2019, ISBN: 9780691178974. 
    - Chapters: Empire of Law, Coding Land, Coding Legal Persons, Minting Debt, Enclosing Nature's Code, A Code for the Globe, The Masters of the Code, A New Code?, Capital Rules by Law.     

### THM.2. Statistical Contract Theory

Basics of the Principal-Agent Model under Information Asymmetry.

- Reference Readings:
    - [The Theory of Incentives: The Principal-Agent Model](https://press.princeton.edu/books/paperback/9780691091846/the-theory-of-incentives), Jean-Jacques Laffont and David Martimort, Princeton University Press, 2002, ISBN: 9780691091846.
    - [Contract Theory](https://mitpress.mit.edu/9780262025768/contract-theory/), Patrick Bolton and Mathias Dewatripont, The MIT Press, 2014, ISBN: 9780262025768.
    - [A Course in Microeconomic Theory](https://press.princeton.edu/books/paperback/9780691202754/a-course-in-microeconomic-theory), David M.. Kreps, Princeton University Press, 2020, ISBN: 9780691202754.

### THM.2. Intellectual Property Laws in Sweden, Corporate Jurisdictions and Sovereignty  

- Professor's Privilege Law:
    - [The Nomos of the University: Introducing the Professor's Privilege in 1940s Sweden](https://doi.org/10.1007/s11024-018-9348-2), Pettersson I., Minerva. 2018;56(3):381-403. doi:10.1007/s11024-018-9348-2
    - University entrepreneurship and professor privilege, Erika Färnstrand Damsgaard, Marie C. Thursby, Industrial and Corporate Change, Volume 22, Issue 1, February 2013, Pages 183–218, https://doi.org/10.1093/icc/dts047

### THM.3


### PRM.1: Scaling Python with Ray in a Hurry

#### User Commands

**Core commands needed to use this repository:**

1. set up ssh for your github account: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/
1. `git clone --recurse-submodules git@github.com:VakeWorks/SovScaDesDisMaLOps.git` # clone the superprojecct
    - `git pull` and `git status` to keep up to date with the repository
    - `git pull --recurse-submodules` to keep up to date with the repository, including its sub-modules
    - deep-dive as required for `git`-ing sub-modules: https://git-scm.com/book/en/v2/Git-Tools-Submodules
1. To run ray and jupyter inside docker to learn from Sccaling Python with Ray:

```
# change directory into SovScaDesDisMaLOps and run the following docker command
docker run --shm-size=2g -t -i -v`pwd`:/home/ray/SovScaDesDisMaLOps -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 rayproject/ray

# for jupyter lala land install it (you can do evevrything with python alone)
pip install jupyter jupytext opencv-python-headless

# to start a head node inside docker / yopu can start ray in python or jupyter dirrectly also
ray start --head --dashboard-host=0.0.0.0

# check status
ray status

# run jupyter notebook server and go to the output URL
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root

# Now you can navigate to http://127.0.0.1:8888/notebooks/SovScaDesDisMaLOps/scalingpythonml/ray_examples/helloWorld/Ray-Ch2-Hello-Worlds.ipynb 

```
 
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
- Falling back on prebuilt images at dockerhub for now: https://hub.docker.com/r/rayproject/ray
    - `docker pull rayproject/ray` # pull docker image for cpu from prebuilt official docker images
    - `docker pull rayproject/ray:latest-aarch64` # Use ARM-based docker images for Apple M1 or M2 MacBooks
    - `docker run --rm --shm-size=10gb -t -i rayproject/ray` # shm-size or shared memory size should be about 1/3rd of available memory on your laptop
        - Try: `ls`, `pwd`, `whoami`, `ray --version` inside docker container
        - `CTRL-D` to exit out of the docker container.
    - `docker run --rm --shm-size=10gb -t -i rayproject/ray-ml` # ray-ml doccker image for ML in ray with libraries.. will take several minutes
        - Try: `ls`, `pwd`, `whoami`, `ray --version` inside docker container
        - `CTRL-D` to exit out of the docker container.
    - `cd PATH-TO/SovScaDesDisMaLOps` and `docker run --rm --shm-size=1G -v `pwd`:/home/ray/SovScaDesDisMaLOps -t -i rayproject/ray` # mount SovScaDesDisMaLOps inside the docker container
- Local Kuberenetes based KIND cluster for deployment: https://kind.sigs.k8s.io/
    - Install: [go 1.17+](https://golang.org/) and [docker](https://www.docker.com/) and [podman](https://podman.io/docs/installation)
<!--- or [nerdctl](https://github.com/containerd/nerdctl) (for MAC nerdctl install [Rancher Desktop](https://rancherdesktop.io/)) -->
    - `go install sigs.k8s.io/kind@v0.29.0`
    - add `export PATH="$(go env GOPATH)/bin:$PATH"` to `~/.bash_profile` so that `kind` is in your PATH. 
    - `kind create cluster` # create kubernetes in docker or kind cluster
    - `kubectl cluster-info --context kind-kind`  # Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/
    - To modify the cluster configuration see: https://kind.sigs.k8s.io/docs/user/configuration/


### PRM.2: Deploying for Sovereign Operations 
