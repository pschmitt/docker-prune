FROM docker:stable

VOLUME ["/var/run/docker.sock"]

COPY ./entrypoint.sh /entrypoint.sh

ENV AGE=7d STICKY_LABEL=persistent_image=true

ENTRYPOINT ["/entrypoint.sh"]
