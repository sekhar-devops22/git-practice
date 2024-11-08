#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "PID of the script executing now: $$"
echo "PID of last working commnad: $!"
echo "state of previous command: $?"