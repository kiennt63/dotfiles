#! /opt/homebrew/bin/python3
import json
import subprocess

result = subprocess.run(
    "system_profiler SPDisplaysDataType -json".split(" "),
    text=True,
    capture_output=True,
)

d = json.loads(result.stdout)
try:
    num_monitors = len(d["SPDisplaysDataType"][0]["spdisplays_ndrvs"])
except Exception as e:
    num_monitors = 1
print(num_monitors)
