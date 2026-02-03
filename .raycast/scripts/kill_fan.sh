#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill Fan
# @raycast.mode fullOutput
# @raycast.packageName System Tools

# Optional parameters:
# @raycast.icon 🔥
# @raycast.needsConfirmation false

echo "Killing fan-related processes..."

processes=("SystemUIServer" "efilogin-helper")

for process in "${processes[@]}"; do
  if pgrep "$process" > /dev/null; then
    pkill "$process"
    echo "☠️ $process killed."
  else
    echo "🚧 $process not running."
  fi
done

echo "Fan silenced. Peace restored."