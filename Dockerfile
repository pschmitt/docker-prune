FROM docker:stable

VOLUME ["/var/run/docker.sock"]

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
