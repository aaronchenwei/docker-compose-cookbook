[Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

Run Jupyter Notebook/Lab inside an already secured environment with no token.


## running with root

```yaml
version: "3"

services:
  scipy-jupyter:
    image: jupyter/scipy-notebook:latest
    user: root
    ports:
      - 8888:8888
    volumes:
      - ./volumes/notebooks:/home/jovyan/notebooks
    environment:
      - JUPYTER_TOKEN=easy
      - GRANT_SUDO=yes
```

We can use follow command to switch into `root` if you need to install any extra packages

```sh
sudo -s
```
