#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

file="$1"

# Generate background image
base_folder="$mydir/../res/themes/element/img/backgrounds"
file="$mydir/background/lake.jpg"
convert "$mydir/background/lake.jpg" "$mydir/../res/themes/element/img/backgrounds/lake.jpg"

# Generate feature & logo image
convert "$mydir/plcomms_icon_round.png" -resize "200x200" "$mydir/../res/themes/element/img/logos/plcomms-logo.png"
convert "$mydir/plcomms_feature_image.png" -resize "1200x630" "$mydir/../res/themes/element/img/logos/opengraph.png"

# Generate favicon & icon 
dest_folder="$mydir/../res/vector-icons"
for w in 24 44 50 76 88 120 150 152 180 300 1024
do
  convert "$mydir/plcomms_icon_round.png" -resize "$wx$w" "$dest_folder/$w.png"
done

for w in "620x300" "1240x600"
do
  convert "$mydir/plcomms_feature_image.png" -resize "$w" "$dest_folder/$w.png"
done

for w in 57 60 72 76 114 120 144 152 180
do
  convert "$mydir/plcomms_icon_round.png" -resize "$wx$w" "$dest_folder/apple-touch-icon-$w.png"
done

for w in 70 150 310 
do
  convert "$mydir/plcomms_icon_round.png" -resize "$wx$w" "$dest_folder/mstile-$w.png"
done

convert "$mydir/plcomms_feature_image.png" -resize "310x150" "$dest_folder/mstile-310x150.png"
convert "$mydir/favicon.ico" "$dest_folder/favicon.ico"
