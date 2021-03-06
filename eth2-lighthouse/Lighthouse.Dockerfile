ARG DOCKER_TAG

FROM sigp/lighthouse:${DOCKER_TAG}

# Unused, this is here to avoid build time complaints
ARG BUILD_TARGET

ARG USER
ARG UID

# See https://stackoverflow.com/a/55757473/12429735RUN
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"

# Create data mount point with permissions
RUN mkdir -p /var/lib/lighthouse && chown ${USER}:${USER} /var/lib/lighthouse && chmod 700 /var/lib/lighthouse

# Script to query whether all validator key passwords are the same
#COPY ./query-lh-validator-passwords.sh /usr/local/bin

# Use an unprivileged user.
USER ${USER}:${USER}

# For voluntary exit
ENV KEYSTORE=nonesuch

ENTRYPOINT lighthouse
