# mdbook and mdslides

This is for dockerized mdbook and mdslides preparation for workshops and courses.

The following files are covered by the LICENSE file in this directory.
They have been simplified and modified for this project.
The original files are from: https://github.com/peaceiris/docker-mdbook/tree/main.

```
.
├── deps
│   ├── Cargo.lock
│   ├── Cargo.toml
│   └── src
│       └── main.rs
├── Dockerfile
├── images
├── LICENSE
├── Makefile
└── README.md
```
## Basic use case

You can simply pull the docker images for amd64/x86 architecture to build and serve the book and slides locally:
```
docker pull vakeworks/mdbook:v0.4.51-amd64
make compose-build
make serve-book 
make serve-slides # in another terminal
```

# Advanced use case
To build the following docker images (or those for your architecture):

- `vakeworks/mdbook:v0.4.51-rust-amd64` and `vakeworks/mdbook:v0.4.51-amd64`

```
make build
```

After build test it:
```
make test
```
You should see the mdbook version output twice for each build like this:
```
mdbook v0.4.51
mdbook v0.4.51
```

To build the mdbook and mdslides:
```
make compose-build
```

To serve the book:
```
make serve-book
```

To serve the slides you need to roll your own server:
```
make serve-slides  # python3 -m http.server -d ./2025/slides
```

To run docker:
```
make run
```

To deploy to webserver you need .env file with variables giving ssh access to webserver.
```
make deploy-to-vakeworks-site
```

## Development in Linux

To push images (with other tags) to dockehub if existing images are outdated or unacceptable.
```
docker push vakeworks/mdbook:v0.4.51-rust-amd64
docker push vakeworks/mdbook:v0.4.51-amd64
```

To do a clean uninstall and reinstallation of docker:

- https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine
- https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

It takes a looong time (hours) to build rust for other architectures using emulation.
So it is easiest to have collaborators build images in their architecture and push to dockerhub.

Here are some notes fro the trials.
To build multiplatform docker images on a linux x86_64/amd64 prepare:
- https://docs.docker.com/build/building/multi-platform/
- with containerd image stores: https://docs.docker.com/engine/storage/containerd/
- and emulation: https://docs.docker.com/build/building/multi-platform/#install-qemu-manually

```
sudo vi /etc/docker/daemon.json # set ture/false { "features": {"containerd-snapshotter": true } }
sudo systemctl restart docker # Restart the daemon for the changes to take effect.
docker info -f '{{ .DriverStatus }}'  
# see [[driver-type io.containerd.snapshotter.v1]] or 
# [[Backing Filesystem extfs] [Supports d_type true] [Using metacopy false] [Native Overlay Diff true] [userxattr false]]
uname -r # check linux kerner version
sudo apt-get install binfmt-support #
docker run --privileged --rm tonistiigi/binfmt --install all
$ sudo ls /proc/sys/fs/binfmt_misc/qemu-*
/proc/sys/fs/binfmt_misc/qemu-aarch64  /proc/sys/fs/binfmt_misc/qemu-loongarch64  /proc/sys/fs/binfmt_misc/qemu-mips64el  /proc/sys/fs/binfmt_misc/qemu-riscv64
/proc/sys/fs/binfmt_misc/qemu-arm      /proc/sys/fs/binfmt_misc/qemu-mips64	  /proc/sys/fs/binfmt_misc/qemu-ppc64le   /proc/sys/fs/binfmt_misc/qemu-s390x
```
See
- https://docs.docker.com/build/building/multi-platform/#simple-multi-platform-build-using-emulation

To completely uninstall:
```
# for each architecture from 
sudo ls /proc/sys/fs/binfmt_misc/qemu-*
docker run --privileged --rm tonistiigi/binfmt --uninstall qemu-aarch64 
...
sudo apt-get remove binfmt-support
sudo rm /etc/docker/daemon.json
```

BUGS
- InvalidDefaultArgInFrom: Default value for ARG "${BASE_IMAGE}" results in empty or invalid base image name (line 45)
  - add `# check=skip=InvalidDefaultArgInFrom` in Dockerfile


---

The following are quick notes for development. They can be ignored as they will be absorbed in the docs/ folder's .md files in time.


### PRM.1: Scaling Python with Ray in a Hurry

#### User Commands

**Core commands needed to use this repository:**

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
