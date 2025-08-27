# Setting Up Laptop

Let us set up our laptop for the practical modules. 

## Starting Docker Container <img src="./images/UnderConstructionWarningGeekByDominiqueChappard_OpenClipArt.png" width="100" align="right" alt="Under Construction">

- Make sure you are in a directory in the host machine that you want to work from as this directory will be mounted inside the docker container.
- We will make a directory named `workshop` and launch docker container from there. 
   - Windows, Mac and Linux: 
       ```sh
       mkdir workshop
       ``` 
   - and change into the directory
     ```sh
     cd workshop
     ```
   - Your current directory should be `workshop` before you launch the next few commands.
     ```sh
     pwd
     ```
```admonish warning
If you are in your home directory or another in your laptop (host) then that directory will get mounted inside the docker container as `/home/ray/workshop`
```

- For most modern mac laptops with silicon M1/M2/etc. on ARM 64 bit processors:
    ```sh
    docker run --shm-size=3g -d -t -i -v ${PWD}:/home/ray/workshop -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 --name=sovscadesdismalops vakeworks/sovscadesdismalops:dev-arm64
    ```
- For most windows, linux and older mac laptops with INTEL x86/amd 64 bit processors:
    ```sh
    docker run --shm-size=3g -d -t -i -v ${PWD}:/home/ray/workshop -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 --name=sovscadesdismalops vakeworks/sovscadesdismalops:dev-amd64
    ```
- Let's understand the above command quickly (deep dive at [docker](./docker.md)). 
- See that the container is running and note its id and name.
    ```sh
    docker ps
    ```
- You should see something like this:

>    CONTAINER ID   IMAGE                                    COMMAND                  CREATED          STATUS          PORTS                                                                                                                                                                                    NAMES
> 12dfbd942909   vakeworks/sovscadesdismalops:dev-amd64   "/bin/bash"              16 minutes ago   Up 16 minutes   0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp, 0.0.0.0:8265->8265/tcp, [::]:8265->8265/tcp, 0.0.0.0:8888->8888/tcp, [::]:8888->8888/tcp, 0.0.0.0:10001->10001/tcp, [::]:10001->10001/tcp   sovscadesdismalops
 
- Also, try: `docker stop sovscadesdismalops`, `docker start sovscadesdismalops`, `docker kill sovscadesdismalops`,..., `docker rm <CONTAINER ID>` etc.

## Get into the container

We can get into the container and use git to download the latest notebooks for the workshop.

```sh
docker exec -i -t sovscadesdismalops /bin/bash
```

This would get you into the sovscadesdismalops docker container. 


> (base) ray@12dfbd942909:~$

Now, you can try the following commands inside the container.

Copy the following command and paste it into the container or just type it in:

This should show the following output:
- print working directory using `pwd`, like so: 
  ```
  pwd
  ```
    > (base) ray@12dfbd942909:~$ pwd
    >
    > /home/ray

- list the files and direcories using `ls` commands. 
  ```
  ls
  ```
  > anaconda3  learn  pip-freeze.txt  requirements_compiled.txt  workshop
- list the files and direcories in `workshop` directory
  ```
  ls workshop
  ```
    - This will show (unless you mounted a directory with files and folders already in it):
      > (base) ray@12dfbd942909:~$
 
## Obtain lab materials

Now let us change directory into `workshop` and use git to download some notebooks for the workshop:

```sh
cd workshop
```

```sh
git clone --no-checkout --depth=1 --filter=tree:0 https://github.com/VakeWorks/SovScaDesDisMaLOps.git 
```

```
cd SovScaDesDisMaLOps/
```

```
git sparse-checkout set --no-cone /labs
```

```
git checkout
```

Now you can use the following commands to see where you are and what has been downloaded with git:
 - `pwd` and `ls -R labs`

It will look something like this with the respective LICENSEs:

```admonish note
(base) ray@12dfbd942909:/home/ray/workshop/SovScaDesDisMaLOps$ pwd
/home/ray/workshop/SovScaDesDisMaLOps
(base) ray@12dfbd942909:/home/ray/workshop/SovScaDesDisMaLOps$ ls -R labs/
labs/:
learning_ray  ray  scalingpythonml

labs/learning_ray:
README.md  notebooks

labs/learning_ray/notebooks:
ch_02_ray_core.ipynb

labs/ray:
LICENSE  README.md  doc

labs/ray/doc:
source

labs/ray/doc/source:
ray-core

labs/ray/doc/source/ray-core:
examples

labs/ray/doc/source/ray-core/examples:
gentle_walkthrough.ipynb

labs/scalingpythonml:
README.md
```
