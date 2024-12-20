#!/bin/zsh

# if [ "$SENDER" = "space_windows_change" ]; then
#   space="$(echo "$INFO" | jq -r '.space')"
#   apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
#
#   icon_strip=" "
#   if [ "${apps}" != "" ]; then
#     while read -r app
#     do
#       icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
#     done <<< "${apps}"
#   else
#     icon_strip=" —"
#   fi
#
#   sketchybar --set space.$space label="$icon_strip"
# fi


if [ "$SENDER" = "aerospace_workspace_change" ]; then
  group_data=$(aerospace list-windows --all --json --format '%{app-name} %{workspace}' | jq -c '
    group_by(.workspace)[] | 
    {workspace: .[0].workspace, apps: (map(.["app-name"]) | unique)}
  ')

  # Preprocess JSON to group by workspace and remove duplicate apps
  # grouped_data=$(echo "$INFO" | jq -c '
  #   group_by(.workspace)[] | 
  #   {workspace: .[0].workspace, apps: (map(.["app-name"]) | unique)}
  # ')

  # Loop over workspace IDs from aerospace list-workspaces --all
  for sid in $(aerospace list-workspaces --all); do
    match_found=false  # Flag to track if the current workspace matches

    # Iterate over grouped data to find a matching workspace
    echo "$grouped_data" | while IFS= read -r group; do
      workspace=$(echo "$group" | jq -r '.workspace')

      if [[ "$workspace" -eq "$sid" ]]; then
        match_found=true
        icon_strip=" "  # Initialize icon_strip

        # Process unique apps for the matching workspace
        echo "$group" | jq -c '.apps[]' | while IFS= read -r app; do
          app_name=$(echo "$app" | jq -r '.')
          icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app_name")"
        done

        # Perform your action for the matching workspace
        sketchybar --set "space.$workspace" label="$icon_strip"
      fi
    done

    # If no match was found for the current sid, handle it here
    if [[ "$match_found" = false ]]; then
      sketchybar --set "space.$sid" label=" "
    fi
  done
fi
