#!/bin/bash
# 04-vector-overlay: vector overlay, buffering, and attribute joins.
# All commands run inside ONE session via inner.sh (see 01-location-setup).
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
grass --tmp-location EPSG:3857 --exec bash "$DIR/inner.sh"
# Failure behavior:
# - Unclosed boundary in poly.txt: v.in.ascii fails topology build.
# - Missing centroid (C line): the square imports as a boundary without an
#   area, and the overlay returns 0 rows instead of 2.
