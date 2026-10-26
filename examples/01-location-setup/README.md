# 01-location-setup — creating a location and mapset, importing rasters and vectors

**Evidence:** design-only, gate 1 target. Not runtime-validated on the fleet.
**Versions:** GRASS 8.5.0 bundled with the QGIS stack (fleet record, all three
Windows nodes).

## What it demonstrates

A throwaway location (`--tmp-location EPSG:3857`, nothing persisted) and the
import of a synthetic 5x5 raster (`base.asc`, 50x50 units, cellsize 10) with
`r.in.ascii`. No fleet data path is touched; the raster is synthetic.

## Run

```bash
bash run.sh
```

## Expected output

- `g.region -p` shows the 50x50 region at resolution 10.
- `r.info -r base` prints `min=10 max=22`.
- `g.list type=raster` shows `base`.

## Failure behavior

- Unknown EPSG code or missing `grass` binary: grass exits before the inner
  script runs.
- Malformed ASCII header: `r.in.ascii` fails naming the bad header line.
- Running `inner.sh` directly outside a session: `g.region` fails because no
  location/mapset environment exists. Always go through `run.sh`.

## To confirm at validation

- The exact `grass` binary path for the QGIS-bundled 8.5.0 on Windows vs a
  standalone GRASS install (this pattern assumes `grass` is on PATH).
- `--tmp-location` flag spelling on 8.5.0.
