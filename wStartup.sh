#! /bin/bash
## Startup before runing daeamon.

### Check connection
ping -q -c1 foreca.fi &>/dev/null && echo online || test="offline"
  
	if [ $test = offline ]; then
	yad --width=300 --height=30 --title="Alert" --text-align=center  \
	--text="<b>You are offline, check www.foreca.fi or your device connection.</b>" --button=Close:0
	  exit
fi

cd ~/WeatherB/

## Location
AREA=$(awk '{ print $1 }' location/country-city.txt | sed 's/|/,/g;s/.$//' location/country-city.txt)

echo $AREA > location.txt

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

## Runs a daemon.
## The nohup command ensures not to be killed when exit.
## Open below script for Fvwm myExt.
nohup ./wDaemon.sh &

### Open below script for DE and WM usage.
# nohup ./imageEXE.sh &
