#!/bin/sh

cd "${GITHUB_WORKSPACE}" || exit 1

detect-secrets --version

git config --global --add safe.directory /github/workspace

detect-secrets scan ${INPUT_DETECT_SECRETS_FLAGS} ${INPUT_WORKDIR} \
    | baseline2rdf -json_filename="${INPUT_JSON_FILENAME}"
