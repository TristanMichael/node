ARG DOCKER_TAG

FROM pegasyseng/teku:${DOCKER_TAG}

#Next two are unused but included to avoid warnings
ARG BUILD_TARGET
ARG USER

ARG UID

USER root

RUN usermod -u "${UID}" teku

# Create data mount point with permissions
RUN mkdir -p /var/lib/teku/validator-keys && mkdir -p /var/lib/teku/validator-passwords && chown -R teku:teku /var/lib/teku && chmod -R 700 /var/lib/teku

# Script to query and store validator key passwords
#COPY ./copy-teku-validator-keys.sh /usr/local/bin

# Use an unprivileged user.
USER teku

ENTRYPOINT /opt/teku/bin/teku
