# GRASS Cookbook

<!-- ZQM-START -->
<!-- markdownlint-disable MD033 -->
<p align="center">
  <strong>ZQM Computing — Geospatial Engineering & Scientific Computing</strong><br>
  <a href="https://github.com/ZQM-Computing">ZQM Computing</a>
</p>
<!-- markdownlint-enable MD033 -->
<!-- ZQM-END -->

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A **GRASS cookbook** for geoscientific analysis, terrain, and watershed modeling. Patterns are drawn from the ZQM fleet's GRASS 8.5.0 installs (bundled with the QGIS stack). It is intended for GIS analysts who need GRASS's analytical depth behind a scriptable interface. Validate each pattern against your own data, software versions, and operating environment before adopting it.

## Repository role and status

**Status:** Active, public — first pattern pass written (design-only, gate 1 target; runtime validation pending).

**What this repository is:** GRASS patterns — see the table below.

**What it contributes:** Part of the ZQM Computing geospatial portfolio. The umbrella index for the series is [geospatial-cookbooks](https://github.com/ZQM-Computing/geospatial-cookbooks).

**Standing:** This repository is maintained independently. Automated checks cover only the paths and environments configured in its workflows; they do not establish production readiness or operational certification.

## Who this is for

GIS analysts who need GRASS's analytical depth behind a scriptable interface.

## Prerequisites

- GRASS 8.5.0
- A location/mapset for your study area, or the sample data in the first pattern
- Bash

## Patterns

| # | Example | Status | What it demonstrates |
|---|---------|--------|----------------------|
| 01 | [01-location-setup](examples/01-location-setup/README.md) | Written | Creating a location and mapset, importing rasters and vectors |
| 02 | [02-raster-analysis](examples/02-raster-analysis/README.md) | Written | Map algebra and neighborhood analysis |
| 03 | [03-watershed](examples/03-watershed/README.md) | Written | Watershed delineation and flow accumulation |
| 04 | [04-vector-overlay](examples/04-vector-overlay/README.md) | Written | Vector overlay, buffering, and attribute joins |
| 05 | [05-python-scripting](examples/05-python-scripting/README.md) | Written | Driving GRASS from Python scripts |

## Repository layout

```text
grass-cookbook/
├── examples/01-location-setup/
├── examples/02-raster-analysis/
├── examples/03-watershed/
├── examples/04-vector-overlay/
├── examples/05-python-scripting/
├── README.md
└── LICENSE
```

## Roadmap

- First pattern pass: the first two table rows
- Second pass: the remaining rows, from fleet-verified setups

## Contributing

A contributing guide lands with the first pattern pass. Report security issues to <zqmcomputing@gmail.com> — please do not open a public issue for those.

## More from this series

- [gdal-cookbook](https://github.com/ZQM-Computing/gdal-cookbook) — GDAL/OGR conversion, reprojection, and raster/vector utilities
- [whitebox-cookbook](https://github.com/ZQM-Computing/whitebox-cookbook) — Terrain and hydrology analysis from the command line
- [postgis-cookbook](https://github.com/ZQM-Computing/postgis-cookbook) — Spatial indexing, joins & KNN, SRID management, vector tiles
