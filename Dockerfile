FROM wurstmeister/kafka:2.12-2.2.0

COPY docker-entrypoint.sh /
COPY run-kafka.sh /

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ADD run-kafka.sh /usr/local/bin/run-kafka.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD /usr/local/bin/docker-entrypoint.sh

FROM docker.io/bitnami/spark:2

USER root
ENV LIVY_HOME /opt/bitnami/livy
WORKDIR /opt/bitnami/
RUN install_packages unzip \
    && curl "https://downloads.apache.org/incubator/livy/0.7.1-incubating/apache-livy-0.7.1-incubating-bin.zip" -O \
    && unzip "apache-livy-0.7.1-incubating-bin" \
    && rm -rf "apache-livy-0.7.1-incubating-bin.zip" \
    && mv "apache-livy-0.7.1-incubating-bin" $LIVY_HOME \
    && mkdir $LIVY_HOME/logs \
    && chown -R 1001:1001 $LIVY_HOME
    
USER 1001

# FROM jupyter/minimal-notebook
# ADD run-envs.sh /tmp/run-envs.sh
# RUN chmod +x /tmp/run-envs.sh
# CMD /tmp/run-envs.sh

# COPY ./requirements.txt /tmp/requirements.txt
# RUN pip install -r /tmp/requirements.txt
# CMD pip install -r /tmp/requirements.txt