#!/bin/bash
set -e

if [ -z "$TAG" ]; then
    echo "TAG is missing, abort"
    echo "pass TAG through environment variable"
    exit 1
fi

if [ -z "$GH_TOKEN" ]; then
    echo "GH_TOKEN is missing, abort."
    echo "pass GH_TOKEN through environment variable"
    exit 1
fi

ghurl="https://api.github.com"
data="{\"ref\": \"master\", \"inputs\": {\"tag\": \"$TAG\"}"
curl \
    -X POST \
    -H "Authorization: token $GH_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d "${data}" \
    "${ghurl}/repos/outscale-mdr/terraform-provider-outscale/actions/workflows/generate_doc.yml/dispatches"
