[Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

```bash
$ docker compose up -d && docker compose logs -f
[...]
jupyter-jupyter-1  | [C 2022-11-17 04:34:11.297 ServerApp] 
jupyter-jupyter-1  |     
jupyter-jupyter-1  |     To access the server, open this file in a browser:
jupyter-jupyter-1  |         file:///home/jovyan/.local/share/jupyter/runtime/jpserver-7-open.html
jupyter-jupyter-1  |     Or copy and paste one of these URLs:
jupyter-jupyter-1  |         http://adaebae5f688:8888/lab?token=454bc177c779de799e7676481d948492a887c600243f8e74
jupyter-jupyter-1  |      or http://127.0.0.1:8888/lab?token=454bc177c779de799e7676481d948492a887c600243f8e74
```
copy the token line
