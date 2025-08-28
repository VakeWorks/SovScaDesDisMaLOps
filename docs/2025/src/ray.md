# Ray

- Ray core walkthrough
  - functions -> tasks
  - classes -> actors
  - basics of ray design
- Reinforcement learning from ray core scratch
- pointers to libraries and ecosystem

## Working with Ray Cluster

Let us get into the docker container and into the `/home/ray/workshop/SovScaDesDisMaLOps/labs` directory as we did at the end of [Set Up](setup.md).

We will do the following:
- start a ray cluster
- check its dashboard on the browser
- submit a python script and get its output
- check the status of the cluster
- finally stop the ray cluster
 

```
ray start --head --dashboard-host 0.0.0.0
```

~~~admonish warning title="shm-size WARNING"
```WARNING: The object store is using /tmp instead of /dev/shm because /dev/shm has only 3221225472 bytes available. This will harm performance! You may be able to free up space by deleting files in /dev/shm. If you are inside a Docker container, you can increase /dev/shm size by passing '--shm-size=9.98gb' to 'docker run' (or add it to the run_options list in a Ray cluster config). Make sure to set this to more than 30% of available RAM.```

It might be best to get out of docker and restart it with the suggested '--shm-size=9.98gb' as we started with '--shm-size=3gb' to be conservative.
~~~

You should getting an output similar but no exactly the same as the following:

~~~admonish note title="output"

```
--------------------
Ray runtime started.
--------------------

Next steps
  To add another node to this Ray cluster, run
    ray start --address='172.17.0.2:6379'
  
  To connect to this Ray cluster:
    import ray
    ray.init()
  
  To submit a Ray job using the Ray Jobs CLI:
    RAY_ADDRESS='http://172.17.0.2:8265' ray job submit --working-dir . -- python my_script.py
  
  See https://docs.ray.io/en/latest/cluster/running-applications/job-submission/index.html 
  for more information on submitting Ray jobs to the Ray cluster.
  
  To terminate the Ray runtime, run
    ray stop
  
  To view the status of the cluster, use
    ray status
  
  To monitor and debug Ray, view the dashboard at 
    172.17.0.2:8265
  
  If connection to the dashboard fails, check your firewall settings and network configuration.
```
~~~

We should be able to find the dashboard for the ray cluster at `http://172.17.0.2:8265/` or `http://localhost:8265/`.


There is a file named `my_script.py` in the labs directory with the following contents:

```python
import ray

runtime_env = {"pip": ["emoji"]}

ray.init(runtime_env=runtime_env)

@ray.remote
def f():
  import emoji
  return emoji.emojize('Python is :thumbs_up:')

print(ray.get(f.remote()))
```

Let us make sure that we can pass this python script to the ray cluster and get the desired output.

```
RAY_ADDRESS='http://172.17.0.2:8265' ray job submit --working-dir . -- python my_script.py
```

~~~admonish note title="output"
```
(base) ray@12dfbd942909:~/workshop/SovScaDesDisMaLOps/labs$ RAY_ADDRESS='http://172.17.0.2:8265' ray job submit --working-dir . -- python my_script.py

Job submission server address: http://172.17.0.2:8265

2025-08-27 10:16:56,952	INFO dashboard_sdk.py:338 -- Uploading package gcs://_ray_pkg_e8bdf52a9ba6994f.zip.

2025-08-27 10:16:56,952	INFO packaging.py:588 -- Creating a file package for local module '.'.

-------------------------------------------------------
Job 'raysubmit_dgEg6widN2VTcxuR' submitted successfully
-------------------------------------------------------

Next steps
  Query the logs of the job:
    ray job logs raysubmit_dgEg6widN2VTcxuR
  Query the status of the job:
    ray job status raysubmit_dgEg6widN2VTcxuR
  Request the job to be stopped:
    ray job stop raysubmit_dgEg6widN2VTcxuR

Tailing logs until the job exits (disable with --no-wait):
2025-08-27 10:16:57,027	INFO job_manager.py:531 -- Runtime env is setting up.
2025-08-27 10:16:59,233	INFO worker.py:1616 -- Using address 172.17.0.2:6379 set in the environment variable RAY_ADDRESS
2025-08-27 10:16:59,240	INFO worker.py:1757 -- Connecting to existing Ray cluster at address: 172.17.0.2:6379...
2025-08-27 10:16:59,255	INFO worker.py:1928 -- Connected to Ray cluster. View the dashboard at 172.17.0.2:8265 
Python is 👍

------------------------------------------
Job 'raysubmit_dgEg6widN2VTcxuR' succeeded
------------------------------------------

```
~~~

Let us examine the status of the ray cluster we started using `ray status` command.

```
ray status
```

~~~admonist note title="output"
```
======== Autoscaler status: 2025-08-27 10:24:51.593334 ========
Node status
---------------------------------------------------------------
Active:
 1 node_49e8ee2c48c0cf79d5bfc18b2f3bdff60b5363f68b17edaa6a1391e1
Pending:
 (no pending nodes)
Recent failures:
 (no failures)

Resources
---------------------------------------------------------------
Total Usage:
 0.0/8.0 CPU
 0B/21.16GiB memory
 0B/9.07GiB object_store_memory

Total Constraints:
 (no request_resources() constraints)
Total Demands:
 (no resource demands)

```
~~~

Let us now stop the ray cluster.

```
ray stop
```

It will give an output like:

```
Stopped all 6 Ray processes.
```

- Now we have tested ray cluster is up and can run scripts we submit to it.
- This is effectively what is done in more complex settings with the ray cluster running in a private or public cloud
- To learn a bit faster we will use jupyter notebooks REPL environment on a browser instead of submitting scripts


## Ray in Jupyter Lab 

Next we can start jupyter lab inside our docker container with no running ray clusters within it.

```
jupyter lab --ip 0.0.0.0 --no-browser --allow-root
```

~~~admonish note title="output"
```
$ jupyter lab --ip 0.0.0.0 --no-browser --allow-root
[I 2025-08-27 10:32:24.139 ServerApp] jupyter_lsp | extension was successfully linked.
[I 2025-08-27 10:32:24.153 ServerApp] jupyter_server_terminals | extension was successfully linked.
[I 2025-08-27 10:32:24.163 ServerApp] jupyterlab | extension was successfully linked.
[I 2025-08-27 10:32:24.165 ServerApp] Writing Jupyter server cookie secret to /home/ray/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2025-08-27 10:32:25.169 ServerApp] notebook_shim | extension was successfully linked.
[I 2025-08-27 10:32:25.326 ServerApp] notebook_shim | extension was successfully loaded.
[I 2025-08-27 10:32:25.329 ServerApp] jupyter_lsp | extension was successfully loaded.
[I 2025-08-27 10:32:25.331 ServerApp] jupyter_server_terminals | extension was successfully loaded.
[I 2025-08-27 10:32:25.342 LabApp] JupyterLab extension loaded from /home/ray/anaconda3/lib/python3.9/site-packages/jupyterlab
[I 2025-08-27 10:32:25.342 LabApp] JupyterLab application directory is /home/ray/anaconda3/share/jupyter/lab
[I 2025-08-27 10:32:25.343 LabApp] Extension Manager is 'pypi'.
[I 2025-08-27 10:32:25.647 ServerApp] jupyterlab | extension was successfully loaded.
[I 2025-08-27 10:32:25.647 ServerApp] Serving notebooks from local directory: /home/ray/workshop/SovScaDesDisMaLOps/labs
[I 2025-08-27 10:32:25.648 ServerApp] Jupyter Server 2.16.0 is running at:
[I 2025-08-27 10:32:25.648 ServerApp] http://12dfbd942909:8888/lab?token=64bc9471350814f6f13da0d250459236a8ceb36d11b31ad4
[I 2025-08-27 10:32:25.648 ServerApp]     http://127.0.0.1:8888/lab?token=64bc9471350814f6f13da0d250459236a8ceb36d11b31ad4
[I 2025-08-27 10:32:25.648 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2025-08-27 10:32:25.670 ServerApp] 
    
To access the server, open this file in a browser:
        file:///home/ray/.local/share/jupyter/runtime/jpserver-4116-open.html
Or copy and paste one of these URLs:

http://12dfbd942909:8888/lab?token=64bc9471350814f6f13da0d250459236a8ceb36d11b31ad4

http://127.0.0.1:8888/lab?token=64bc9471350814f6f13da0d250459236a8ceb36d11b31ad4

```
~~~

This should output: `copy and paste one of these URLs:`

Open the URL `http://127.0.0.1:8888/lab?token=....` with a long token of your own. Try `http://localhost:8888/lab?token=....` if the local IP address doesn't work.
 
