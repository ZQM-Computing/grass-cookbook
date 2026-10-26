#!/bin/bash
# Runs INSIDE one GRASS session (called by run.sh). Do not run standalone.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
g.region n=50 s=0 w=0 e=50 res=10
v.in.ascii input="$DIR/points.txt" output=points format=standard --overwrite
v.in.ascii input="$DIR/poly.txt" output=poly format=standard --overwrite
v.category input=points output=points_cat option=add --overwrite
v.db.addtable map=points_cat columns='name varchar(10)'
v.db.update map=points_cat column=name value='A' where='cat = 1'
v.db.update map=points_cat column=name value='B' where='cat = 2'
v.db.update map=points_cat column=name value='C' where='cat = 3'
v.buffer input=points_cat output=points_buf distance=100 --overwrite
v.overlay ainput=points_cat binput=poly operator=and output=points_in_poly --overwrite
echo '--- buffer table rows (expect 3):'
v.db.select points_buf | tail -n +2 | wc -l
echo '--- overlay table rows (expect 2: A and B inside the square):'
v.db.select points_in_poly | tail -n +2 | wc -l
# Expected: 3 buffer rows (one per point) and 2 overlay rows.
# Point C (25,25) falls outside the 0..20 square, so it drops out of the
# overlay. Buffer radii are large enough that all three buffers intersect
# the square — the overlay here tests POINTS, not buffers.
