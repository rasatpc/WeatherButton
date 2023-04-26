# WeatherButton
Takes a screenshot of your selected weather website, crops it, and makes an icon button and image dialog box. This is a Do-it-yourself (DIY) app to customize your weather information as per your nearest and accurate station. Each site is different as well as the language. This is a model of how it is made. It runs in Fvwm (myExt) and in any DE or WM.

Requires Cutycapt and ImageMagic:
* sudo apt install cutycapt imagemagick-common
* sudo pacman -Syu cutycapt imagemagick
* sudo dnf install cutycapt ImageMagick

# For DE and WM
Make one folder and copy the content to it:
* $ mkdir ~/WeatherB

Updates weather button every 15 minutes, edit script ~/wStartup.sh line 46.

Position the button, edit --geometry="+1000+50" in script ~/imageEXE.sh

Run script:
* $ cd ~/WeatherB
* $ ./wStartup.sh

# For Fvwm (myExt)
Make a link and copy the content to it:
* $ ln -s ~/.fvwm/userEXT/WeatherB/ WeatherB

Updates weather button every 15 minutes, edit script ~/wStartup.sh line 43.

To run, edit file ~/.fvwm/userEXT.sys

Add this line:

Read $[HOME]/WeatherB/weatherIMG.sys

Position the weather dialog box, add these lines in coreEXT/1Functions/WinPosition/winPos.sys

+ I ThisWindow ("FCWeather") Move -2 -35
+ I ThisWindow ("WSettting") Move -4 -10
