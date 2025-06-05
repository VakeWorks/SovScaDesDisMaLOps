# mdbook and mdslides

This is for dockerized mdbook and mdslides preparation for workshops and courses.

The following files are covered by the LICENSE.
They have been simpllliffied and modified ffor this project..
The originaal project is from: https://github.com/peaceiris/docker-mdbook/tree/main
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

To build the mdbook and mdslides
```
make compose-build
```

To serve the book
```
make compose-serve
```

To serve the slides you need to roll your own server
```
python3 -m http.server -d ./2025/slides
```

To run docker
```
make run
```
