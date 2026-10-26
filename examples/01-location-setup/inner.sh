#!/usr/bin/env bash
# Runs INSIDE one GRASS session (called by run.sh). Do not run standalone:
# it needs the session's GISDBASE/LOCATION/MAPSET environment.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

g.region n=50 s=0 w=0 e=50 res=10 -p
r.in.ascii input="$DIR/base.asc" output=base --overwrite

# Turn the documented fixture contract into executable assertions. This catches
# a changed fixture, an import that silently selects the wrong file, or an
# unexpected GRASS output format before the example can be called successful.
stats="$(r.info -r base)"
printf '%s\n' "$stats"
grep -Eq '^min=10([.]0+)?$' <<<"$stats" || {
  echo "Expected base raster minimum 10; got: $stats" >&2
  exit 1
}
grep -Eq '^max=22([.]0+)?$' <<<"$stats" || {
  echo "Expected base raster maximum 22; got: $stats" >&2
  exit 1
}

rasters="$(g.list type=raster)"
printf '%s\n' "$rasters"
grep -Fxq 'base' <<<"$rasters" || {
  echo "Imported raster 'base' was not listed by g.list" >&2
  exit 1
}
echo "PASS: imported synthetic raster base (min=10, max=22)"
