#!/bin/bash

# Launch server only if no process is found and then launch client
emacsclient -a "" -c $@

