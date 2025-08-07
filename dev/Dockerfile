FROM rayproject/ray:dev 
#FROM rayproject/ray:latest-aarch64
#FROM rayproject/ray # or other arch

RUN sudo apt-get update

RUN python --version
RUN pip --version
RUN pip install -U ipywidgets
RUN pip install jupyterlab


# Install the application dependencies
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt

# Copy in the learn folder and change its owner to user ray
COPY docs/learn ./learn
RUN sudo chown -R ray learn/
# for development work on /home/ray/SovScaDesDisMaLOps/docs/learn/
# for learning as student work on /home/ray/learn
# to persist changes copy from /home/ray/learn to mounted folder /home/ray/SovScaDesDisMaLOps/

# Expose the following ports
EXPOSE 6379
EXPOSE 10001
EXPOSE 8265
EXPOSE 8888

# if you want a specific working directory inside the container
# WORKDIR home/ray/SovScaDesDisMaLOps

# Setup a user so the container doesn't run as the root user
# RUN useradd learner
# USER learner
# But we will run as the default user ray

# syntax to run some app 
#CMD ["wallenberg", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]

# we will typically run jupyter notebook server for learning
RUN echo "jupyter lab --ip 0.0.0.0 --no-browser --allow-root"

######################################################################
############## Development command tips ##############################
######################################################################
# to build docker image from Dockerfile in this directory and call it test:latest
# docker build -t sovscadesdismalops:latest .
# On intel x86_64/amd64 architecture: `docker build -t sovscadesdismalops:dev-amd64 .`
# On arm mac M1/M2/... architecture:  `docker build -t sovscadesdismalops:dev-arm64 .`
# to run in daemon mode
# docker run --shm-size=3g -d -t -i -v`pwd`:/home/ray/SovScaDesDisMaLOps -p8888:8888 -p6379:6379 -p10001:10001 -p8265:8265 sovscadesdismalops 

# to see running containers
# docker ps

# to execute inside running docker container as root or ray user:
# docker exec -u root -it <containerID> /bin/bash
# docker exec -u ray -it <containerID> /bin/bash
# inside docker container you can launch a ray cluster from command-line:
# ray start --head --dashboard-host 0.0.0.0
# inside docker container you can run jupyter as follows:
# jupyter lab --ip 0.0.0.0 --no-browser --allow-root
######################################################################

################ Raaz/Alfred TODO ####################################
# add .ipynb files from 

# FROM:
#  learning_ray/
#  ray/
#  scalingpythonml/

# TO:
#  learn/...

# FOR EXAMPLE:
# FROM:
#  ray/doc/source/ray-core/examples/gentle_walkthrough.ipynb
# TO:
#  learn/ray/doc/source/ray-core/examples/gentle_walkthrough.ipynb
# BY:
# mkdir -p docs/learn/ray/doc/source/ray-core/examples/
# cp ray/doc/source/ray-core/examples/gentle_walkthrough.ipynb docs/learn/ray/doc/source/ray-core/examples/
######################################################################
