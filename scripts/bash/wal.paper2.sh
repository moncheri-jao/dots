#!/bin/bash
function gsetstring ()
{
	local x
	x=$(gsettings get org.gnome.desktop.background picture-uri)
	local y=${x#\'file://}
	if [[ "$bgpath" != "$x" ]]; then
		local bgpath=${y::-1}
		wal -qi "$bgpath"
	else
		wal -r && clear
	fi
}
gsetstring