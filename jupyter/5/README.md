[Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

Run Jupyter Notebook/Lab inside an already secured environment with no token.


## running with root

```yaml
version: "3"

services:
  scipy-jupyter:
    image: jupyter/scipy-notebook:python-3.10
    hostname: scipy-notebook
    user: root
    restart: unless-stopped
    ports:
      - 8888:8888
    environment:
      - JUPYTER_TOKEN=easytoken
      - GRANT_SUDO=yes
```

We can use follow command to switch into `root` if you need to install any extra packages

```sh
sudo -s
```

## Copy jupyter notebook

```sh
$ docker run --rm -v $PWD:/source -v jupyter_work:/dest -w /source alpine cp -v test.ipynb /dest
```
