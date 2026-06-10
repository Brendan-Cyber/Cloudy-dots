#!/usr/bin/env bash

set -eu

# Poll hyprctl layers and set monitor reserved top area when a gtk-layer-shell
# surface is anchored at the top (y==0). Runs until killed.

MONITOR_NAME="eDP-1"
SLEEP_INTERVAL=1

get_current_reserved_top() {
  hyprctl monitors | awk '/reserved:/ {print $2,$3,$4,$5; exit}' 2>/dev/null || echo "0 0 0 0"
}

while true; do
  toph=0
  while IFS= read -r line; do
    # match lines like: Layer 564bba20cff0: xywh: 0 0 1920 30, namespace: gtk-layer-shell, pid: 54124
    if [[ $line =~ xywh:\ ([0-9]+)\ ([0-9]+)\ ([0-9]+)\ ([0-9]+),\ namespace: ]]; then
      x=${BASH_REMATCH[1]}
      y=${BASH_REMATCH[2]}
      w=${BASH_REMATCH[3]}
      h=${BASH_REMATCH[4]}
      # if y==0 (anchored to top), consider it for top reserved
      if [ "$y" -eq 0 ] && [ "$h" -gt "$toph" ]; then
        toph=$h
      fi
    fi
  done < <(hyprctl layers)

  # get current reserved top (hyprctl monitors prints: reserved: L T R B)
  read -r _ curr_top _ _ <<< "$(hyprctl monitors | awk '/reserved:/ {print $2,$3,$4,$5; exit}')" || curr_top=0

  if [ "$toph" -ne "$curr_top" ]; then
    if [ "$toph" -eq 0 ]; then
      hyprctl eval "hl.monitor({ output = \"$MONITOR_NAME\", reserved_area = { top = 0 } })" || true
    else
      hyprctl eval "hl.monitor({ output = \"$MONITOR_NAME\", reserved_area = { top = $toph } })" || true
    fi
  fi

  sleep "$SLEEP_INTERVAL"
done
