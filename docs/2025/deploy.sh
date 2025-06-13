#!/bin/sh
################################################################################
### This is to deploy built book and slides to vake.works and requires .env  ###
################################################################################

source .env
echo "running deploy.sh"

eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY"  | tr -d '\r' | ssh-add -
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts

rm -rf vakeworks-site/SovScaDesDisMaLOps/2025 
mkdir -p vakeworks-site/SovScaDesDisMaLOps/2025
cp -r book vakeworks-site/SovScaDesDisMaLOps/2025
cp -r slides vakeworks-site/SovScaDesDisMaLOps/2025

rsync -a -e "ssh -p 21098" vakeworks-site/ $VAKEWORKS_USERNAME@$VAKEWORKS_SERVER:~/www
rsync --delete -a -e "ssh -p 21098" vakeworks-site/SovScaDesDisMaLOps/2025/ $VAKEWORKS_USERNAME@$VAKEWORKS_SERVER:~/www/SovScaDesDisMaLOps/2025

rm -rf .env
