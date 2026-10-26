# 04-vector-overlay — vector overlay, buffering, and attribute joins

**Evidence:** design-only, gate 1 target. Not runtime-validated on the fleet.
**Versions:** GRASS 8.5.0 bundled with the QGIS stack (fleet record).

## What it demonstrates

- Import of synthetic points (A at 5,5; B at 15,5; C at 25,25) and a square
  polygon (0,0 to 20,20, boundary + centroid).
- Categories + attribute table: `v.category`, `v.db.addtable`,
  `v.db.update` naming the points A, B, C.
- Buffering: `v.buffer` distance 100 around each point.
- Overlay: `v.overlay operator=and` of points against the square.

## Run

```bash
bash run.sh
```

## Expected output

- Buffer table: 3 rows (one per point).
- Overlay table: 2 rows (A and B). Point C (25,25) falls outside the 0..20
  square and drops out. Note the overlay tests the points, not the buffers
  — all three buffers intersect the square, so a buffer overlay would
  return 3, not 2.

## Failure behavior

- Unclosed boundary in `poly.txt`: `v.in.ascii` fails the topology build.
- Missing centroid (`C` line): the square imports as a boundary without an
  area, and the overlay returns 0 rows instead of 2.

## To confirm at validation

- `v.in.ascii` point/category handling on 8.5.0 (this pattern adds
  categories with `v.category` rather than asserting import-time cats).
- `v.db.select` header-line handling (`tail -n +2` assumes exactly one
  header line).
- The 3/2 row counts on a live run.
