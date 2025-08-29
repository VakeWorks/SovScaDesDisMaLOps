# Set Up, Labs & Objectives

## Set Up Laptop

Let us set up our laptop for the practical modules. 

### Starting Docker Container <!--<img src="./images/UnderConstructionWarningGeekByDominiqueChappard_OpenClipArt.png" width="100" align="right" alt="Under Construction"> -->

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

    ```CONTAINER ID   IMAGE                                    COMMAND                  CREATED          STATUS          PORTS  NAMES```

    ```12dfbd942909   vakeworks/sovscadesdismalops:dev-amd64   "/bin/bash"              16 minutes ago   Up 16 minutes   0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp, 0.0.0.0:8265->8265/tcp, [::]:8265->8265/tcp, 0.0.0.0:8888->8888/tcp, [::]:8888->8888/tcp, 0.0.0.0:10001->10001/tcp, [::]:10001->10001/tcp   sovscadesdismalops```
 
- Also, try: `docker stop sovscadesdismalops`, `docker start sovscadesdismalops`, `docker kill sovscadesdismalops`,..., `docker rm <CONTAINER ID>` etc.

### Get into the container

We can get into the container and use git to download the latest notebooks for the workshop.

```sh
docker exec -i -t sovscadesdismalops /bin/bash
```

This would get you into the sovscadesdismalops docker container. 

``` (base) ray@12dfbd942909:~$  ```

Now, you can try the following commands inside the container.

Copy the following command and paste it into the container or just type it in:

This should show the following output:
- print working directory using `pwd`, like so: 
  ```
  pwd
  ```
  ```(base) ray@12dfbd942909:~$ pwd```

  ```/home/ray```

- list the files and direcories using `ls` commands. 
  ```
  ls
  ```
  
  ```anaconda3  learn  pip-freeze.txt  requirements_compiled.txt  workshop```

- list the files and direcories in `workshop` directory
  ```
  ls workshop
  ```
    - This will show (unless you mounted a directory with files and folders already in it):
      ```(base) ray@12dfbd942909:~$```
 
### Obtain lab materials

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

~~~admonish note title="output"
```
(base) ray@12dfbd942909:/home/ray/workshop/SovScaDesDisMaLOps$ pwd
/home/ray/workshop/SovScaDesDisMaLOps
(base) ray@12dfbd942909:/home/ray/workshop/SovScaDesDisMaLOps$ ls -R labs/
labs/:
learning_ray  my_script.py  nishihara_blogpost  ray  scalingpythonml

labs/learning_ray:
LICENSE  README.md  notebooks

labs/learning_ray/notebooks:
ch_01_overview.ipynb  ch_02_ray_core.ipynb  ch_03_core_app.ipynb  images

labs/learning_ray/notebooks/images:
chapter_01  chapter_02  chapter_03

labs/learning_ray/notebooks/images/chapter_01:
AIR.png        cartpole.png     ray_layers.png      simple_cluster.png
Ecosystem.png  ds_workflow.png  ray_layers_old.png

labs/learning_ray/notebooks/images/chapter_02:
architecture.png  map_reduce.png  task_dependency.png  worker_node.png

labs/learning_ray/notebooks/images/chapter_03:
train_policy.png

labs/nishihara_blogpost:
aggregation_example.ipynb  images

labs/nishihara_blogpost/images:
DepGraphAdd1to8_RobertNishihara.webp

labs/ray:
LICENSE  README.md  doc

labs/ray/doc:
source

labs/ray/doc/source:
ray-core

labs/ray/doc/source/ray-core:
examples

labs/ray/doc/source/ray-core/examples:
gentle_walkthrough.ipynb  images

labs/ray/doc/source/ray-core/examples/images:
task_dependency.png

labs/scalingpythonml:
README.md
```
~~~

To check out a fresh and latest copy on August 29 2025 after lunch for the labs you can delete the older labs according to commands in the Warning and repeat the above steps in [Obtain lab materials](#obtain-lab-materials). It is best to wait to do the Set Up together as the notebooks are being prepared and tested. Otherwise you can use `git` and resolve conflicts if any.

```admonish warning
cd /home/ray/workshop/

rm -rf /home/ray/workshop/SovScaDesDisMaLOps 
```

## Next Steps for Labs

- Let us do a show of hands now to gauge the distribution of current experiences and skills
  - How many of you are (1) *already familiar*, (2) somewhat familiar, (3) not at all familiar with:
    - command-line interface to interact with machines?
    - git for distributed version control?
    - docker containers?
    - ray?
  - let us assign a *triangle*, a *square* or a *circle* to each of you based on your responses.
    - Traingles are those who have more familiarity with at least two of the above four items.
    - Squares are those who have some familiarity with at least one the above four items.
    - Circles are those who least familiarity with most of the above four items.
  - GOAL: When you do `YouTrys` in the labs on your own own make sure you are in a group of 3-4 students with at least one Triangle or Square. Ideally, each group should not have only Circles.
- Operating System (OS) show of hands. How many of you have one of the following OSs?
    - Linux and other Unix-like operating systems?
    - Have Linux laptop?
    - Have Windows laptop?
    - Have Mac laptop?
    - Have Harmony OS laptop?
- We will glance next over [Command-Line Interface](./cli.md), [Docker](./docker.md) and [Git](./git.md) to motivate and let those with less experience deep-dive later.
- We will quickly demonstrate how to get our fingers on the keys and work on the labs by directly using the minimal required steps to get to our main destination that is [Ray](./ray.md), an open source project for parallel and distributed Python.
- You are expected to use your laptops to follow along in real-time. 
  - If you get stuck, don't worry as there will be exercises or *YouTrys* to get you try on your own in a small group with perhaps others who can help.
    - Raaz and Alfred will be moving around the small groups during *YouTrys*.

## Objective of the Labs and Bigger Picture

- The objective of the labs is to help you take the first steps in this highly integrative field of sovereign scalable data engineering sciences and distributed machine learning operations. 
- It is also to perhaps inspire you to consider taking the elective 6 hp WASP PhD course entirely with Raaz in a more focused and structured mathematical and coding setting over a whole semester in the Fall of 2026 titled [*Scalable Data Science and Distributed Machine Learning (ScaDaMaLe)*](https://lamastex.github.io/ScaDaMaLe/) where you will do group projects with others. 
  - Checkout the past student group project presentations reachable from the above link, where peer-reviewed executible books were written in  2020, 2022 and 2024 instances of the course with the corresponding oral presentations in the following links curated by year as follows:
    - [ScaDaMaLe-WASP-2024 peer-reviewed book via links](https://lamastex.github.io/ScaDaMaLe/000_0-sds-3-x-projects-2024/)
      - [ScaDaMaLe-WASP-2024 oral presentations playlist](https://youtube.com/playlist?list=PL_I1mOIPmfpaASsoY-RREd3DtU88qtRlj&si=xtQFghz-kcDzNQMo)
    - [ScaDaMaLe-WASP-2022 peer-reviewed book with embedded oral presentations](https://lamastex.github.io/ScaDaMaLe/000_0-sds-3-x-projects-2022/)
      - [ScaDaMaLe-WASP-2022 oral presentations playlist](https://youtube.com/playlist?list=PL_I1mOIPmfpbiH5AosoguS8ntkFl_Ql_7&si=oyUv6cNZm07RmMTl)
    - [ScaDaMaLe-WASP-2020 peer-reviewed book with embedded oral presentations](https://lamastex.github.io/ScaDaMaLe/000_0-sds-3-x-projects/)
