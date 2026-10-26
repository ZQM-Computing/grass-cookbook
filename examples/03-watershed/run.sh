#!/bin/bash
# 03-watershed: watershed delineation and flow accumulation on a synthetic DEM.
# All commands run inside ONE session via inner.sh (see 01-location-setup).
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
grass --tmp-location EPSG:3857 --exec bash "$DIR/inner.sh"
# Failure behavior:
# - Flat DEM (no gradient): flow direction is undefined and r.watershed
#   warns about unresolved flow; the plane DEM here avoids that.
# - Threshold larger than the grid: no basins delineate; threshold=2 fits 5x5.
