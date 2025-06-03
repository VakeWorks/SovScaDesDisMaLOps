# How to Install Ray on Linux (devbian/Ubuntu)?

We will use python virtual environments to installl ray.

- Read: https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/

```
python3 -m venv .venv 
 
# .gitignore will ignore .venv

# activate the virtual environment
source .venv/bin/activate
 
# check python is from .venv/
which python

# upgrde pip
python3 -m pip install --upgrade pip

# pip version
python3 -m pip --version

# install ray for ML workloads
pip install -U "ray[data,train,tune,serve]"
 
# check version of ray
ray --version

```

