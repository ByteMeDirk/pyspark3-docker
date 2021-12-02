# pyspark3-docker
A single node PySpark3 docker container based on OpenJDK.
Using Python 3, PySpark 3.0.3 with Spark 3.1.2 and Hadoop 2.7.

The image is set up to allow for any extensive Python3 with Spark development for 
testing, local development and pipelines. 

[![](https://img.shields.io/docker/image-size/dirkscgm/pyspark3/latest)](https://hub.docker.com/r/dirkscgm/pyspark3) 
[![](https://img.shields.io/docker/v/dirkscgm/pyspark3?sort=semver)](https://hub.docker.com/r/dirkscgm/pyspark) 
[![Publish to Docker](https://github.com/DirksCGM/pyspark3-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/DirksCGM/pyspark3-docker/actions/workflows/docker-publish.yml)


Image includes AWS tools for Python:
 - AWS Cli : https://pypi.org/project/awscli/
 - Boto3: https://pypi.org/project/boto3/

## Running Docker Image for AWS Development:

The docker image may assume local AWS configurations and secrets on run for specific python scripts:
```shell
docker run --rm=true -v ~/.aws:/root/.aws <etc...>
```

This image can be extended to run any PySpark .py script using `python3`.

## Example
Set up your local docker container that will run your scripts, 
in our case it could be `scripts/main.py` and one could set up the data in `data/*`:
```docker
FROM dirkscgm/pyspark3:latest

WORKDIR /app

COPY scripts/* scripts/
COPY data/* data/

ENTRYPOINT ["python3"]
CMD ["scripts/main.py"]
```

Build the local image:
```shell
docker build -t pyspark3 .
```

Run the container with the CMD set to the main entrypoint of the spark application:
```shell
docker run --rm=true pyspark3
```
