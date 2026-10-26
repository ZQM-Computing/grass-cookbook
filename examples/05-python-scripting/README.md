# 05-python-scripting — driving GRASS from Python scripts

**Evidence:** design-only, gate 1 target. Not runtime-validated on the fleet.
**Versions:** GRASS 8.5.0 bundled with the QGIS stack (fleet record).

## What it demonstrates

The `grass.script` API: `run_command` for `g.region`, `r.in.ascii`, and
`r.mapcalc`, and `parse_command` for `r.univar -g`, printing the result as
JSON. The computation repeats `02-raster-analysis` (same synthetic grid), so
the expected output is already known: doubled-grid statistics.

## Run

```bash
bash run.sh
```

## Expected output

One JSON line:

```json
{"max": 44.0, "mean": 27.68, "min": 20.0, "n": 25, "sum": 692.0}
```

## Failure behavior

- Script run directly (no GRASS session): exits with the GISBASE error
  message, not an `ImportError` traceback.
- Bad mapcalc expression: `gs.run_command` raises and the traceback names
  the failing module.

## To confirm at validation

- `grass.script` import path for the QGIS-bundled 8.5.0 on Windows
  (bundled GRASS Python setup differs from standalone; the pattern assumes
  the session environment provides it, which is what `--exec` is for).
- `r.univar -g` key spellings on 8.5.0 (`n`, `sum`, `mean`, `min`, `max`).
- The stated JSON on a live run.
