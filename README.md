## What is it

Simply runs jupyter notebook server on `8888` port (example for [Puzl cloud](https://puzl.ee)).

## Requirements

- Python 3.6 or higher
- `requirements.txt`

All the requirements are installing in `run.sh` file, which should be set as a Docker entry point.

## Run

### Docker image

Choose any Docker image, contains:
1. Needed version of Python.
2. Jupyter Notebook.

or use any pre-defined machine learning image from [Puzl cloud](https://puzl.ee). You can [find dockerfiles here](https://github.com/puzl-ee/create-custom-docker-image/tree/master/example).

### Git repository
To use your repo from Github without ssh inside a Docker container, [generate](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line) and use personal access token.
```
https://a72db2630fa574a11445c16e6824617e4c3d8017@github.com/puzl-ee/example-jupyter-notebook-server.git
```

### Entry point
This will install all `requirements.txt` and run application then.
```bash
bash ./run.sh
```

### Jupyter port

Add port `8888` via Puzl dashboard.

![Open port in Puzl dashboard](port-screenshot.png?raw=true "Open port")

Kubernetes `Service` will be created for your pod automatically.

### Environment variables
`NOTEBOOK_DIR` - optional path to Jupyter directory, default is `/media`

> **Notice:** if you use Puzl dashboard, we highly recommend to create a volume and put its path `/media/%volume_name%` to `NOTEBOOK_DIR`

## Use

After your pod is up and running in Kubernetes cluster:
1. View logs of this pod.
2. Find Jupyter access token in logs.
3. Copy token.
4. Access your Jupyter by a given external port and host name with `YOUR_TOKEN` copied from pod's logs.

`http://host:external_port/?token=YOUR_TOKEN`

## Using SSL for encrypted communication

Ignore browser errors because self-signed certificate is used.

If you don't need ssl:
1. Comment 1 line in `run.sh`

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/mykey.key -out /tmp/mycert.pem
```

2. Comment 2 lines in `jupyter_notebook_config.py`

```
c.NotebookApp.certfile = '/tmp/mycert.pem'
c.NotebookApp.keyfile = '/tmp/mykey.key'
```
