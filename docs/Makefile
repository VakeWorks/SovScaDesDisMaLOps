#include .env
DOCKER_CLI_EXPERIMENTAL := enabled
DOCKER_BUILDKIT := 1

CURRENT_WORKING_DIR := $(shell pwd)
DOCKER_BOOK_DIR := ./2025
DOCKER_USERNAME := raazesh
DOCKER_ORGZNAME := vakeworks
VAKEWORKS_SITE_DIR := vakeworks-site
VAKEWORKS_BOOK_SLIDES_DIR := SovScaDesDisMaLOps
DOCKER_IMAGE_NAME := mdbook
DOCKER_HUB_BASE_NAME := ${DOCKER_ORGZNAME}/${DOCKER_IMAGE_NAME}
DOCKER_BASE_NAME := ghcr.io/${DOCKER_HUB_BASE_NAME}
ALPINE_BASE_IMAGE := alpine:3.22.0
RUST_BASE_IMAGE := rust:1.87.0-alpine3.22
DOCKER_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdbook = ' | awk '{print $$3}' | tr -d '"')
MDBOOK_MERMAID_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdbook-mermaid = ' | awk '{print $$3}' | tr -d '"')
MDBOOK_TOC_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdbook-toc = ' | awk '{print $$3}' | tr -d '"')
MDBOOK_ADMONISH_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdbook-admonish = ' | awk '{print $$3}' | tr -d '"')
MDSLIDES_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdslides = ' | awk '{print $$3}' | tr -d '"')
MDBOOK_GRAPHVIZ_VERSION := $(shell cat ./deps/Cargo.toml | grep 'mdbook-graphviz = ' | awk '{print $$3}' | tr -d '"')
DOCKER_TAG := v${DOCKER_VERSION}
GITHUB_REF_NAME ?= local
DOCKER_SCOPE := mdbook-${GITHUB_REF_NAME}
DOCKER_OUTPUT_TYPE ?= docker
ifeq ($(IS_PULL_REQUEST), false)
	DOCKER_OUTPUT_TYPE := registry
endif
PKG_NAME := ${DOCKER_BASE_NAME}:${DOCKER_TAG}
HUB_NAME := ${DOCKER_HUB_BASE_NAME}:${DOCKER_TAG}
PKG_LATEST := ${DOCKER_BASE_NAME}:latest
HUB_LATEST := ${DOCKER_HUB_BASE_NAME}:latest

ARCH := $(shell uname -m)
ifeq ($(ARCH), x86_64)
	PLATFORM := amd64
	CARGO_TARGET := x86_64-unknown-linux-musl
else ifeq ($(ARCH), arm64)
	PLATFORM := arm64
	CARGO_TARGET := aarch64-unknown-linux-musl
else ifeq ($(ARCH), aarch64)
	PLATFORM := arm64
	CARGO_TARGET := aarch64-unknown-linux-musl
endif

## do commandline login instructions Logging Into the default Docker Registries at DockerHub and GitHub 
## generate personal access tokens at dockerhub and github and put the tokens in .env file in this directory
## https://docs.docker.com/security/for-developers/access-tokens/
## https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
.PHONY: login-dockerhub
login-dockerhub:
	echo "${DOCKERHUB_PersonalAccessTOKEN}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

.PHONY: login-ghcr
login-ghcr:
	echo "${GITHUB_PersonalAccessTOKEN}" | docker login ghcr.io -u "${DOCKER_USERNAME}" --password-stdin

.PHONY: login
login: login-dockerhub login-ghcr

.PHONY: setup-buildx
setup-buildx:
	docker buildx create --use --driver docker-container
	docker buildx inspect --bootstrap
	docker version

.PHONY: build
build: build-alpine build-rust

.PHONY: build-alpine
build-alpine:
	docker buildx build . \
		--tag "${HUB_NAME}-$(PLATFORM)" \
		--output "type=${DOCKER_OUTPUT_TYPE}" \
		--cache-from "type=gha,scope=${DOCKER_SCOPE}" \
		--cache-to "type=gha,mode=max,scope=${DOCKER_SCOPE}" \
		--build-arg MDBOOK_VERSION="${DOCKER_VERSION}" \
		--build-arg BASE_IMAGE="${ALPINE_BASE_IMAGE}" \
		--build-arg MDBOOK_MERMAID_VERSION="${MDBOOK_MERMAID_VERSION}" \
		--build-arg MDBOOK_TOC_VERSION="${MDBOOK_TOC_VERSION}" \
		--build-arg MDBOOK_ADMONISH_VERSION="${MDBOOK_ADMONISH_VERSION}" \
		--build-arg MDSLIDES_VERSION="${MDSLIDES_VERSION}" \
		--build-arg MDBOOK_GRAPHVIZ_VERSION="${MDBOOK_GRAPHVIZ_VERSION}" \
		--build-arg CARGO_TARGET="${CARGO_TARGET}"

.PHONY: build-rust
build-rust:
	docker buildx build . \
		--tag "${HUB_NAME}-rust-$(PLATFORM)" \
		--output "type=${DOCKER_OUTPUT_TYPE}" \
		--cache-from "type=gha,scope=${DOCKER_SCOPE}" \
		--cache-to "type=gha,mode=max,scope=${DOCKER_SCOPE}" \
		--build-arg MDBOOK_VERSION="${DOCKER_VERSION}" \
		--build-arg BASE_IMAGE=${RUST_BASE_IMAGE} \
		--build-arg MDBOOK_MERMAID_VERSION="${MDBOOK_MERMAID_VERSION}" \
		--build-arg MDBOOK_TOC_VERSION="${MDBOOK_TOC_VERSION}" \
		--build-arg MDBOOK_ADMONISH_VERSION="${MDBOOK_ADMONISH_VERSION}" \
		--build-arg MDSLIDES_VERSION="${MDSLIDES_VERSION}" \
		--build-arg MDBOOK_GRAPHVIZ_VERSION="${MDBOOK_GRAPHVIZ_VERSION}" \
		--build-arg CARGO_TARGET="${CARGO_TARGET}"

## not fully tested as it requires multi-architecture docker settings. See README.md
.PHONY: merge 
merge:
	docker buildx imagetools create --tag "${PKG_NAME}" "${HUB_NAME}-amd64" "${HUB_NAME}-arm64"
	docker buildx imagetools create --tag "${HUB_NAME}" "${HUB_NAME}-amd64" "${HUB_NAME}-arm64"
	docker buildx imagetools create --tag "${PKG_LATEST}" "${HUB_NAME}-amd64" "${HUB_NAME}-arm64"
	docker buildx imagetools create --tag "${HUB_LATEST}" "${HUB_NAME}-amd64" "${HUB_NAME}-arm64"
	docker buildx imagetools create --tag "${PKG_NAME}-rust" "${HUB_NAME}-rust-amd64" "${HUB_NAME}-rust-arm64"
	docker buildx imagetools create --tag "${HUB_NAME}-rust" "${HUB_NAME}-rust-amd64" "${HUB_NAME}-rust-arm64"
	docker buildx imagetools create --tag "${PKG_LATEST}-rust" "${HUB_NAME}-rust-amd64" "${HUB_NAME}-rust-arm64"
	docker buildx imagetools create --tag "${HUB_LATEST}-rust" "${HUB_NAME}-rust-amd64" "${HUB_NAME}-rust-arm64"

.PHONY: test
test:
	@docker run --rm "${HUB_NAME}-$(PLATFORM)" --version
	@docker run --rm "${HUB_NAME}-rust-$(PLATFORM)" --version

.PHONY: test-build
test-build:
	docker run --rm -v "${DOCKER_BOOK_DIR}:/book" "${HUB_NAME}-$(PLATFORM)" build
	docker run --rm -v "${DOCKER_BOOK_DIR}:/book" --entrypoint sh "${HUB_NAME}-$(PLATFORM)" -c 'mdbook-admonish install /book'

## Not using latest tags to force awareness of intricate dependencies of all the exact versions
.PHONY: test-build-with-latest
test-build-with-latest:
	docker run --rm -v "${DOCKER_BOOK_DIR}:/book" "${HUB_LATEST}" build
	docker run --rm -v "${DOCKER_BOOK_DIR}:/book" --entrypoint sh "${HUB_LATEST}" -c 'mdbook-admonish install /book'

.PHONY: run
run:
	docker run --rm -i -t -v "${DOCKER_BOOK_DIR}:/book" -p "3000:3000" -p "3001:3001" --entrypoint sh "${HUB_NAME}-$(PLATFORM)"

.PHONY: compose-build
compose-build:
	cd "${DOCKER_BOOK_DIR}" && \
	docker compose run --rm mdbook build && \
	docker compose run --rm --entrypoint sh mdbook -c 'rm -rf ./slides' && \
	docker compose run --rm --entrypoint sh mdbook -c 'mdslides --template ./template.html --output-dir ./slides --mdbook-path . --index-template ./index-template.html' && \
	docker compose run --rm --entrypoint sh mdbook -c 'cp -r ./src/images ./slides/' && \
	cd "${CURRENT_WORKING_DIR}"

.PHONY: serve-book
serve-book:
	cd ${DOCKER_BOOK_DIR} && \
	docker compose up && \
	cd ${CURRENT_WORKING_DIR}

.PHONY: serve-slides
serve-slides:
	python3 -m http.server -d "${DOCKER_BOOK_DIR}/slides" 

.PHONY: deploy-to-vakeworks-site
deploy-to-vakeworks-site:
	cp .env "${DOCKER_BOOK_DIR}"
	docker run --rm -i -t -v "${DOCKER_BOOK_DIR}:/book" --entrypoint /book/deploy.sh "${HUB_NAME}-$(PLATFORM)"
