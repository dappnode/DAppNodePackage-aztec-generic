# syntax=docker/dockerfile-upstream:master
ARG UPSTREAM_IMAGE=azteclabs/aztec
ARG UPSTREAM_VERSION=v6.0.0
FROM ${UPSTREAM_IMAGE}:${UPSTREAM_VERSION#v}

ARG NETWORK
ARG L1_CHAIN_ID
ARG DATA_DIRECTORY

ENV NETWORK=${NETWORK} \
    L1_CHAIN_ID=${L1_CHAIN_ID} \
    DATA_DIRECTORY=${DATA_DIRECTORY}

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
