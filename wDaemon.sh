#! /bin/bash
## Bash script as a daemon in the background (runs every 15 minutes).

while :; do

cd ~/WeatherB/
sleep 900

## Link
URL=$(sed 's/,/\//g' location.txt)

## Creates weather screenshot.
cutycapt --url=foreca.fi/$URL --out=cache/forecaWEB.png # 800x5821

## Crop temperatre and blue color.
convert cache/forecaWEB.png -crop 102x50+216+1394 -resize 92x -fuzz 15% -fill 'rgb(180,221,225)' -opaque white cache/forecaICON-c.png # celsius

## Weather icon and append temperature.
convert cache/forecaWEB.png -crop 92x90+380+1390 -resize 70x cache/forecaICON.png # icon
convert image/iconBKG-92x90.png cache/forecaICON.png -gravity center -composite cache/forecaICON.png
convert cache/forecaICON-c.png cache/forecaICON.png -append image/forecaNOW.png # 92x135

## Crop wind direction and speed.
convert cache/forecaWEB.png -crop 42x40+527+1400 cache/forecaWDIR.png
convert cache/forecaWEB.png -crop 50x40+525+1443 cache/forecaSPEED.png
convert cache/forecaWDIR.png cache/forecaSPEED.png +append blue -colorize 6 cache/dirSpeed.png
convert image/forecaNOW.png cache/dirSpeed.png -append image/forecaNOWds.png # 92x175

done
