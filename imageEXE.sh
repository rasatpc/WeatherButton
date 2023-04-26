#! /bin/bash
## Weather icon button for DE and WM.
## Updates the button every 15 minutes and 8 sec.

while :; do
cd ~/WeatherB/

# Create weather button
convert image/forecaNOW.png cache/dirSpeed.png -append -resize 68x image/forecaNOWds68x.png # 68x129

yad --title="IconWeather" --geometry="+1000+50" --button='!image/forecaNOWds68x.png!Name:bash -c "./weatherBOX.sh"' &

sleep 908
yad_pid=$(echo $!)
kill $yad_pid

done
