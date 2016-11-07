#!/bin/bash

set -euo pipefail

DELAY="60"

while true; do
  bot=$(head -$((${RANDOM} % `wc -l < IMAGES` + 1)) IMAGES | tail -1)
  docker run --env-file $(basename ${bot})/env --rm ${bot}
  sleep ${DELAY}
done
