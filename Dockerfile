FROM docker

LABEL maintainer=achillesrasquinha@gmail.com

RUN set -o errexit -o nounset \
	&& echo "Installing dependencies" \
	&& apk add --no-cache \
        bash \
        gcc \
        curl \
        musl-dev \
        libffi-dev \
        openssl-dev \
        python3-dev \
        py3-pip \
        make \
    && pip3 install --upgrade pip \
    && pip3 install docker-compose

COPY ./entrypoint /entrypoint
RUN sed -i 's/\r//' /entrypoint \
	&& chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["help"]
