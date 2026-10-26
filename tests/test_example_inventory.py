import unittest
from pathlib import Path

ROOT = Path(__file__).parents[1]
EXAMPLES = ROOT / "examples"
EXPECTED = {
    "01-location-setup",
    "02-raster-analysis",
    "03-watershed",
    "04-vector-overlay",
    "05-python-scripting",
}


class ExampleInventoryTests(unittest.TestCase):
    def test_all_five_patterns_are_present(self):
        actual = {path.name for path in EXAMPLES.iterdir() if path.is_dir()}
        self.assertEqual(actual, EXPECTED)

    def test_each_pattern_has_documentation_and_runner(self):
        for name in sorted(EXPECTED):
            with self.subTest(pattern=name):
                directory = EXAMPLES / name
                self.assertTrue((directory / "README.md").is_file())
                self.assertTrue((directory / "run.sh").is_file())

    def test_runner_scripts_fail_fast(self):
        for script in sorted(EXAMPLES.glob("*/run.sh")):
            with self.subTest(script=script.relative_to(ROOT)):
                self.assertRegex(script.read_text(encoding="utf-8"), r"(?m)^set -e(?:uo pipefail)?$")


if __name__ == "__main__":
    unittest.main()
