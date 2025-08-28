# Prepare Your Laptop

- You will be learning the practical modules on your own laptops.
- Prepare your laptop with the following three tasks well before the workshop.

## Task 1: Update System

- Make sure your laptop is up to date and secure. You can do this by updating your system software on Mac, Windows or Linux as follows:
    - [Keep your Mac up to date](https://support.apple.com/guide/mac-help/keep-your-mac-up-to-date-mchlpx1065/mac)
    - [How to Update Windows 10 & 11: A Step-by-Step Guide](https://www.wikihow.com/Update-Windows) 
    - [How to update Linux: Debian, CentOS, Ubuntu, Fedora](https://1gbits.com/blog/how-to-update-linux/)

## Task 2: Install Docker

- Install Docker on your laptop by following these intructions for your laptop:
    - Docker Desktop is available for Mac, Linux and Windows
        - <https://docs.docker.com/desktop>
        - <https://docs.docker.com/get-started/introduction/get-docker-desktop/>
    - Alternatively, On Linux Install Docker Engine
        - <https://docs.docker.com/engine/install/>

## Task 3: Check Docker Works

- Check that your docker installation was successful
    - Open your CLI terminal and start a container by running the command:
        ```sh
        docker run hello-world
        ```
        - You should receive a `Hello from Docker!` in the output.
    - Run `welcome-to-docker` as daemon mapping port 80 to 8080.
        ```sh
        docker run -d -p 8080:80 docker/welcome-to-docker
        ```
        - Visit <http://localhost:8080> in your browser to access this container and see a welcome message.
        - Identify and Stop the running `welcome-to-docker` container.

## Task 4: Pull workshop docker images

- We will use the workshop's latest docker images built for the two main processor architectures.
- First you need to find out which type of processor your laptop has (do an online search if you don't know how).
- You can simply pull *exactly one* of these docker images for your laptop as follows:
  - For most modern mac laptops with silicon M1/M2/etc. on ARM 64 bit processors:
      ```sh
      docker pull vakeworks/sovscadesdismalops:dev-arm64
      ```
  - For most windows, linux and older mac laptops with INTEL x86/amd 64 bit processors:
      ```sh
      docker pull vakeworks/sovscadesdismalops:dev-amd64
      ```
- You should be able to open terminal inside a running docker container
- [OPTIONAL] You can checkout [command-line](./cli.md) and [docker](./docker.md) pages we will be going through.
- [OPTIONAL] Advanced Exercise: You can build these docker images from scratch on your own by following [Docker Ray Dev](./docker-ray-dev.md).

