# Development

The following are quick notes for development. They can be ignored as they will be absorbed in the docs/ folder's .md files in time.

**Core commands needed to develop in this repository:**

1. set up ssh for your github account: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/
1. `git clone --recurse-submodules git@github.com:VakeWorks/SovScaDesDisMaLOps.git` # clone the superprojecct
    - `git pull` and `git status` to keep up to date with the repository
    - `git pull --recurse-submodules` to keep up to date with the repository, including its sub-modules
    - deep-dive as required for `git`-ing sub-modules: https://git-scm.com/book/en/v2/Git-Tools-Submodules
1. Install ray locally on your linux Mac or Windows laptop:
    - [Unix/Linux](install/local/ray/linux/README.md)
    - [Mac](install/local/ray/mac/README.md)
1. To run ray and jupyter inside docker to learn from Scaling Python with Ray:
    - Learn about Jupyterlab notebooks: https://jupyterlab.readthedocs.io/en/latest/user/notebook.html

change directory into SovScaDesDisMaLOps and run the following docker command

**Unix/Linux/x86_64:**
```
docker run --shm-size=2g -t -i -v`pwd`:/home/ray/SovScaDesDisMaLOps -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 rayproject/ray
```
**ARM64/Apple Silicon (M1,M2 etc.):**
```
docker run --shm-size=2g -t -i -v`pwd`:/home/ray/SovScaDesDisMaLOps -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 rayproject/ray:latest-aarch64
```

to start a head node inside docker / you can start ray in python or jupyter dirrectly also
```
ray start --head --dashboard-host=0.0.0.0
```

check status or check dashboard http://172.17.0.1:8265 or whatever URL output from `ray start`

```
ray status
```

for jupyter notebook convenience install it (you can do everything with python alone
and run jupyter notebook server at the output URL
```
## pip install jupyter jupytext opencv-python-headless
## jupyter notebook --ip 0.0.0.0 --no-browser --allow-root

# for jupyterlab
pip install jupyterlab 
```
run Jupyterlab
```
jupyter lab --ip 0.0.0.0 --no-browser --allow-root
```

Open the jupyter notebook server from the given output URL after running previous command.
Now you can navigate to:
http://127.0.0.2:8888/lab/tree/SovScaDesDisMaLOps/scalingpythonml/ray_examples/helloWorld/Ray-Ch2-Hello-Worlds.ipynb
 
#### Peparation

Core commands to create this repository, including the addition of submodues.

```
# get source codes for "scaling python with ray" and "learning ray"  books from VakeWorks forks
git submodule add git@github.com:VakeWorks/scalingpythonml.git
git submodule add git@github.com:VakeWorks/learning_ray.git

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
