# 02-raster-analysis — map algebra and neighborhood analysis

**Evidence:** design-only, gate 1 target. Not runtime-validated on the fleet.
**Versions:** GRASS 8.5.0 bundled with the QGIS stack (fleet record).

## What it demonstrates

- Map algebra: `doubled = base * 2` over the synthetic 5x5 grid from
  `01-location-setup` (same values, copied here so this pattern runs alone).
- Neighborhood analysis: a 3x3 average filter with `r.neighbors`.
- Statistics with `r.univar -g`.

## Run

```bash
bash run.sh
```

## Expected output

- `r.univar doubled -g`: `n=25 sum=692 mean=27.68 min=20 max=44`.
  (Base grid: sum 346, mean 13.84, min 10, max 22 — doubled throughout.
  Arithmetic recomputed independently before writing; see validation note.)
- `r.out.ascii base_smooth`: the center cell reads 17.11, the mean of its
  3x3 window (15 18 15 / 18 22 18 / 15 18 15 = 154/9).

## Failure behavior

- Bad mapcalc expression: `r.mapcalc` fails naming the expression error.
- Missing input map: the module fails with "map not found".

## To confirm at validation

- `r.neighbors` edge handling (only the center cell is asserted here).
- `r.univar -g` key spellings on 8.5.0 (`n`, `sum`, `mean`, `min`, `max`).
- That the doubled-grid statistics match the stated values on a live run
  (they are hand-computed from the grid; a live run is the check).
