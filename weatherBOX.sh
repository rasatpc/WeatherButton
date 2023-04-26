#! /bin/bash
## By Rasat 14 April 2023
## Weather website cropping and Yad dialog box.

cd ~/WeatherB/

## Crop website (width x height + left + top).
convert cache/forecaWEB.png -crop 685x395+215+1371 image/forecaCROP.png

## Day weather and gravity.
convert cache/forecaWEB.png -crop 255x117+220+1935 -resize 200x image/forecaDAY.png # day weather
convert image/forecaCROP.png image/forecaDAY.png -gravity center -geometry +190+97 -composite image/forecaCROP.png

yad --title="FCWeather" --image=image/forecaCROP.png --fontname="DejaVu Sans Mono Book 10" \
    --button='Setting:bash -c "./location/countryCity.sh"' \
    --button='Restart:bash -c "killall -SIGUSR1 fvwm3"' \
    --button=gtk-close:0 --undecorated
