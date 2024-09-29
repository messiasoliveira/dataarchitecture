FROM wurstmeister/kafka:2.12-2.2.0

COPY docker-entrypoint.sh /
COPY run-kafka.sh /

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ADD run-kafka.sh /usr/local/bin/run-kafka.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD /usr/local/bin/docker-entrypoint.sh
