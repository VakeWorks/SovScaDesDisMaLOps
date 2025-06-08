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

To build the mdbook and mdslides
```
make compose-build
```

To serve the book
```
make serve-book
```

To serve the slides you need to roll your own server
```
make serve-slides  # python3 -m http.server -d ./2025/slides
```

To run docker
```
make run
```

## Development

To push images (with other tags) to dockehub if existing images are outdated or unacceptable.
```
docker push vakeworks/mdbook:v0.4.51-rust-amd64
docker push vakeworks/mdbook:v0.4.51-amd64
```

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
docker run --privileged --rm tonistiigi/binfmt --install 
$ sudo ls /proc/sys/fs/binfmt_misc/qemu-*
/proc/sys/fs/binfmt_misc/qemu-aarch64  /proc/sys/fs/binfmt_misc/qemu-loongarch64  /proc/sys/fs/binfmt_misc/qemu-mips64el  /proc/sys/fs/binfmt_misc/qemu-riscv64
/proc/sys/fs/binfmt_misc/qemu-arm      /proc/sys/fs/binfmt_misc/qemu-mips64	  /proc/sys/fs/binfmt_misc/qemu-ppc64le   /proc/sys/fs/binfmt_misc/qemu-s390x
```
See
- https://docs.docker.com/build/building/multi-platform/#simple-multi-platform-build-using-emulation

