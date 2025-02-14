FROM python:3

ADD src /src

RUN pip install -U pip

# Install DBT libraries
RUN pip install --no-cache-dir dbt-core

RUN pip install --no-cache-dir dbt-redshift

RUN pip install --no-cache-dir boto3

RUN pip install --no-cache-dir awscli

WORKDIR /src

RUN chmod -R 755 .

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD ["./run_dbt.sh"]