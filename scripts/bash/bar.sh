#!/bin/bash
killall -q polybar
echo "---" | tee -a /tmp/polybar.log
polybar example --config=$HOME/.config/polybar/config 2>1& 
