#!/bin/bash
# Runs INSIDE one GRASS session (called by run.sh). Do not run standalone.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
g.region n=50 s=0 w=0 e=50 res=10
r.in.ascii input="$DIR/base.asc" output=base --overwrite
r.mapcalc "doubled = base * 2" --overwrite
r.univar doubled -g
r.neighbors input=base output=base_smooth method=average size=3 --overwrite
r.out.ascii input=base_smooth
# Expected: r.univar doubled -g prints n=25 sum=692 mean=27.68 min=20 max=44.
# Expected: the center cell of base_smooth is 154/9 = 17.11 (mean of the 3x3
# window 15 18 15 / 18 22 18 / 15 18 15). Edge cells are NOT asserted:
# r.neighbors edge handling is a validation item.
