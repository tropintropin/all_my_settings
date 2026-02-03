#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Temperature and Fan
# @raycast.mode silent
# @raycast.packageName System Tools

# Optional parameters:
# @raycast.icon ⚡

osascript <<EOF
tell application "iTerm2"
    activate
    set newWindow to (create window with default profile)
    tell the current session of newWindow
        write text "sudo powermetrics --samplers smc"
    end tell
end tell
EOF
