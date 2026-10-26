#!/bin/bash
# Runs INSIDE one GRASS session (called by run.sh). Do not run standalone:
# it needs the session's GISDBASE/LOCATION/MAPSET environment.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
g.region n=50 s=0 w=0 e=50 res=10 -p
r.in.ascii input="$DIR/base.asc" output=base --overwrite
r.info -r base
g.list type=raster
# Expected: r.info -r prints min=10 max=22; g.list shows base.
