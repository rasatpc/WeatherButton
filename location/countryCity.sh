#! /bin/bash
cp location/country-city.txt location/country-city.bkp

LOC=$(awk '{ print $1 }' location/country-city.txt | sed 's/|/ /g' location/country-city.txt)
echo $LOC > location.txt
CONT=$(awk '{ print $1 }' location.txt)
CITY=$(awk '{ print $2 }' location.txt)
PLACE=$(awk '{ print $3 }' location.txt)

URL=$(sed 's/,/\//' location.txt) 

yad --width=400 --title="WSettting" --text="<big><b>Enter location:</b></big>" --form --field="Country":TEXT "$CONT" > location/country-city.txt --field="City":TEXT "$CITY" > location/country-city.txt --field="Place":TEXT "$PLACE" > location/country-city.txt --button=Cancel:1 --button=Ok:0

if [ $? -ne 0 ]; then
cp location/country-city.bkp location/country-city.txt
  exit
fi
