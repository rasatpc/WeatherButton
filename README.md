# WeatherButton
Takes a screenshot of your selected weather website, crops it, makes an icon button and image dialog box, without opening the web browser.

This is a Do-It-Yourself (DIY) app to customize your weather information as per your nearest and accurate station. Each site is different as well as the language. This is a model of how it is made. It runs in Fvwm (myExt) and in any DE or WM.

Requires Cutycapt and ImageMagic:
* sudo apt install cutycapt imagemagick-common
* sudo pacman -Syu cutycapt imagemagick
* sudo dnf install cutycapt ImageMagick

# For Fvwm, DE and WM
Make one folder and copy the content to it:
* $ mkdir ~/WeatherB

# For DE and WM
Updates weather button every 15 minutes, edit script ~/wStartup.sh line 46.

Position the button, edit --geometry="+1000+50" in script ~/imageEXE.sh

Position weather dialog box, edit script $[HOME]/WeatherB/weatherBOX.sh

Position weather dialog setting, edit script $[HOME]/WeatherB/location/countryCity.sh

Run script:
* $ cd ~/WeatherB
* $ ./wStartup.sh

# For Fvwm
Updates weather button every 15 minutes, edit script ~/wStartup.sh line 43.

To run, add this line in your config file:
Read $[HOME]/WeatherB/weatherIMG.sys

Position weather dialog box, edit script $[HOME]/WeatherB/weatherBOX.sh

Position weather dialog setting, edit script $[HOME]/WeatherB/location/countryCity.sh
