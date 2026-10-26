# 03-watershed — watershed delineation and flow accumulation

**Evidence:** design-only, gate 1 target. Not runtime-validated on the fleet.
**Versions:** GRASS 8.5.0 bundled with the QGIS stack (fleet record).

## What it demonstrates

`r.watershed` on a synthetic DEM: a 5x5 plane sloping east (50 40 30 20 10
in every row). Flow direction is unambiguous — every cell's steepest descent
is east — so the accumulation pattern is hand-computable and makes a real
check instead of a vague "it ran".

## Run

```bash
bash run.sh
```

## Expected output

- `r.out.ascii acc`: every row reads `1 2 3 4 5`; grid maximum 5.
- Drainage direction is eastward throughout (read from the accumulation
  pattern, not from the `dir` encoding, whose value mapping is a validation
  item).

## Failure behavior

- Flat DEM: flow direction is undefined and `r.watershed` warns about
  unresolved flow. The plane DEM here avoids that case.
- Threshold larger than the grid: no basins delineate. `threshold=2` fits
  a 5x5 grid.

## To confirm at validation

- That default `r.watershed` flow is single-direction on 8.5.0 (the stated
  accumulation pattern assumes it; multiple-flow-direction flags would
  change the values).
- The `dir` raster's direction-value encoding, if the pattern is extended
  to assert directions directly.
- The stated accumulation grid on a live run.
