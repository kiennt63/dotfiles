#!/bin/bash

aerospace list-windows --all --json --format "%{app-name} %{workspace}" | jq -r 'group_by(.workspace) | .[] | {workspace: .[0].workspace, apps: map(."app-name")} | 
        "\(.workspace) \(.apps | join(" "))"'
