FROM python:3.8.6

# RUN pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple

RUN pip install --upgrade pip && pip install setuptools psycopg2-binary sqlalchemy pyhive elasticsearch-dbapi ibm_db_sa jupyter graph-notebook pandas numpy sklearn scipy boto3 graphviz jupyter_http_over_ws dask pyarrow modin

# RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets
RUN python -m graph_notebook.static_resources.install && python -m graph_notebook.nbextensions.install

RUN mkdir -p /opt/app/notebook/data && groupadd --system --gid=1000 app\
    && useradd --system --no-log-init --gid app --uid=1000 app -m

COPY entrypoint.sh /opt/app/entrypoint.sh
COPY notebooks /opt/app/notebook/notebooks

RUN python -m graph_notebook.notebooks.install --destination /opt/app/notebook

RUN mkdir /home/app/.jupyter && chmod +x /opt/app/entrypoint.sh \
    && chown -R app:app /opt/app \
    && chown -R app:app /home/app


ENV NOTEBOOK_PASS "sha1:92cf1ff5134d:eecd093c46b3b5b98285ab0238ebe929e640b2a8"
ENV SESSION_LENGTH "4h"

EXPOSE 8888

WORKDIR /opt/app/notebook

USER app

ENTRYPOINT ["/opt/app/entrypoint.sh"]

CMD ["job"]
