#!/bin/bash

# Launch server only if no process is found and then launch client
pgrep -f 'emacs --daemon' || emacs --daemon && emacsclient -c $@

