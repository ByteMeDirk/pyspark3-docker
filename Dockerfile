FROM ubuntu:18.04

ENV SPARK_VERSION=3.1.2
ENV HADOOP_VERSION=2.7
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

WORKDIR /app

COPY requirements.txt .
RUN apt-get update \
    && apt-get install -y python3 python3-pip wget software-properties-common openjdk-8-jdk \
    && export JAVA_HOME \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache -r requirements.txt \
    && wget --no-verbose http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && apt-get remove -y curl bzip2  \
    && apt-get autoremove -y  \
    && apt-get clean
