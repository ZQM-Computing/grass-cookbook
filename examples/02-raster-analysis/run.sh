#!/bin/bash
# 02-raster-analysis: map algebra and neighborhood analysis on a synthetic grid.
# All commands run inside ONE session via inner.sh (see 01-location-setup).
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
grass --tmp-location EPSG:3857 --exec bash "$DIR/inner.sh"
# Failure behavior:
# - Bad mapcalc expression: r.mapcalc fails naming the expression error.
# - Missing input map: r.mapcalc / r.neighbors fail with "map not found".
