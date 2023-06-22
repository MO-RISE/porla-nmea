FROM debian:bullseye as BUILD

RUN apt-get update && apt-get install -y \
    make \
    gcc \
    xsltproc \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir canboat && \
    wget -q -O - https://github.com/canboat/canboat/archive/refs/tags/v4.12.0.tar.gz | tar xvz --strip-components=1 --overwrite -C /canboat && \
    cd canboat && \
    make

FROM ghcr.io/mo-rise/porla:v0.1.0

COPY --from=BUILD --chmod=555 /canboat/rel/linux-x86_64/* /usr/local/bin/
