FROM python:3.11.4-buster

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        wget \
    && pip install detect-secrets[word_list]

COPY baseline2rdf.py /usr/local/bin/baseline2rdf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
