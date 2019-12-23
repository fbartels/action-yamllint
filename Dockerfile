FROM python:3.7.6-alpine3.10

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.9.14
RUN apk --no-cache add git && \
    pip install yamllint

COPY entrypoint.sh /entrypoint.sh

WORKDIR /reviewdog

ENTRYPOINT ["/entrypoint.sh"]
