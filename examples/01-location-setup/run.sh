#!/bin/bash
# 01-location-setup: create a throwaway location and import a synthetic raster.
# All GRASS commands run inside ONE session via inner.sh: a --tmp-location
# is fresh per invocation, so splitting commands across invocations loses state.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
grass --tmp-location EPSG:3857 --exec bash "$DIR/inner.sh"
# Failure behavior:
# - Unknown EPSG code or missing grass binary: grass exits before inner.sh runs.
# - Malformed ASCII header: r.in.ascii fails naming the bad header line.
# - Running inner.sh directly (outside a session): g.region fails because
#   no location/mapset environment exists.
