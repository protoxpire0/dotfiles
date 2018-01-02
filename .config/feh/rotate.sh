#
/bin/bash
#
# Created by djazz // Dangershy
# Dependencies: feh
#

FOLDER="/home/protoxpire0/Pictures/Wallpapers"
DELAY=30

# to make it loop over lines instead of spaces in filenames
IFS=$'\n';

# pick a random folder in Wallpapers
SUBFOLDER=$(ls ${FOLDER} | sort -R | sed -n 1p)
WALLPAPERS_FOLDER=$FOLDER/$SUBFOLDER

while true; do
	LIST=`find "$WALLPAPERS_FOLDER" -type f \( -name '*.jpg' -o -name '*.png' \) | shuf`
	for i in $LIST; do
		echo "$i"
#		gsettings set org.gnome.desktop.background picture-uri "file://$i"
		feh "$i" --bg-fill
#		pcmanfm -w "$i"
		sleep ${DELAY}m
	done
	sleep 1
done
