#!/bin/bash

freshclam_pid=$(pidof freshclam)
if [ -n "$freshclam_pid" ]; then
  kill $freshclam_pid
  echo "Killed process with PID $freshclam_pid"
else
  echo "Process not found"
fi
