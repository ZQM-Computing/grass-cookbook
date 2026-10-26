#!/usr/bin/env python3
"""05-python-scripting: drive GRASS from a Python script.

Runs INSIDE a GRASS session (see run.sh). Outside a session it exits with
a clear message instead of an ImportError traceback.
"""
import json
import os
import sys

if "GISBASE" not in os.environ:
    sys.exit("ERROR: no GRASS session. Run via run.sh (grass --tmp-location ... --exec).")

import grass.script as gs

here = os.path.dirname(os.path.abspath(__file__))
gs.run_command("g.region", n=50, s=0, w=0, e=50, res=10)
gs.run_command(
    "r.in.ascii",
    input=os.path.join(here, "base.asc"),
    output="base",
    overwrite=True,
)
gs.run_command("r.mapcalc", expression="doubled = base * 2", overwrite=True)
stats = gs.parse_command("r.univar", map="doubled", flags="g")
print(
    json.dumps(
        {
            "n": int(float(stats["n"])),
            "sum": float(stats["sum"]),
            "mean": float(stats["mean"]),
            "min": float(stats["min"]),
            "max": float(stats["max"]),
        },
        sort_keys=True,
    )
)
