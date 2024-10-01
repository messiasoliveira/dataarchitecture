FROM wurstmeister/kafka:2.12-2.2.0

COPY docker-entrypoint.sh /
COPY run-kafka.sh /

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ADD run-kafka.sh /usr/local/bin/run-kafka.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD /usr/local/bin/docker-entrypoint.sh

FROM jupyter/minimal-notebook
ADD run-envs.sh /tmp/run-envs.sh
RUN chmod +x /tmp/run-envs.sh
CMD /tmp/run-envs.sh

# COPY ./requirements.txt /tmp/requirements.txt
# RUN pip install -r /tmp/requirements.txt
# CMD pip install -r /tmp/requirements.txt