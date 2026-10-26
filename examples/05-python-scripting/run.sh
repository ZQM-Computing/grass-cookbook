#!/bin/bash
# 05-python-scripting: run script.py inside a throwaway GRASS session.
# Expected output (one JSON line):
# {"max": 44.0, "mean": 27.68, "min": 20.0, "n": 25, "sum": 692.0}
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
grass --tmp-location EPSG:3857 --exec python3 "$DIR/script.py"
# Failure behavior:
# - script.py run directly (no session): exits with the GISBASE error message.
# - Bad mapcalc expression: gs.run_command raises and the traceback names
#   the failing module.
