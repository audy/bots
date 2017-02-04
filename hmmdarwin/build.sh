#!/bin/bash

set -euo pipefail

image="audy/hmmdarwin"

docker build \
  --tag ${image} \
  .
