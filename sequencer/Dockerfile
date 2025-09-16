ARG UPSTREAM_VERSION

FROM aztecprotocol/aztec:${UPSTREAM_VERSION}

# Set ENV variables based on the build-time ARGs
ARG NETWORK
ARG L1_CHAIN_ID
ARG DATA_DIRECTORY

ENV NETWORK=${NETWORK} \
    DATA_DIRECTORY=${DATA_DIRECTORY}

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN apt-get update && apt-get install -y lz4 wget

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
