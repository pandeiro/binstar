#!/bin/bash

echo "Starting Deluge server and connecting..."

# if no Deluge server process can be found
if [ $(pgrep deluge-web) -ne 0 ]; then
    # Launch Deluge in another process
    deluge-web &
fi

# Launch Deluge client in a chromeless browser
exec "$BROWSER" --app=http://localhost:8112




# todo: -c = with chrome; -n native gtk client instead of browser
