#!/bin/bash
# Runs INSIDE one GRASS session (called by run.sh). Do not run standalone.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
g.region n=50 s=0 w=0 e=50 res=10
r.in.ascii input="$DIR/dem.asc" output=dem --overwrite
r.watershed elevation=dem accumulation=acc drainage=dir threshold=2 --overwrite
r.out.ascii input=acc
# Expected: every row of acc reads "1 2 3 4 5" — on a plane sloping east,
# default single-direction flow sends each cell east, so each row accumulates
# 1, 2, 3, 4, 5 west to east and the grid maximum is 5.
# This holds for DEFAULT (single-direction) flow. If r.watershed is run with
# multiple-flow-direction flags, the values differ — that is a validation item.
