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
To build the following docker images for your architecture:

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

To push images (with other tags) to dockehub if existing images are outdated or unacceptable.
```
docker push vakeworks/mdbook:v0.4.51-rust-amd64
docker push vakeworks/mdbook:v0.4.51-amd64
```
