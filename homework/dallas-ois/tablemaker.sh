case=$(cat data-hold/csv/* | cut -d ',' -f 2| head -n 20)
# location=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 4| tr -d '"')
# pdfname=$(cat data-hold/csv/*| cut -d ',' -f 1| tr -d '[:punct:]'| cut -c 24-)
printf 'case_number | date | location | suspect status | suspects | officers | grand_jury | Latitude | Longitude | Text \n'
for x in $case; do

case_number=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 2| tr -d '[:punct:]')  
date=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 3| tr -d '"')
status=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 5| tr -d '"')
weapon=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 8| tr -d '"')
suspect=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 9| tr -d '"')
officers=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 10| tr -d '"')
grand_jury=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 11| tr -d '"')
location=$(cat data-hold/csv/* | grep -E "$x" | cut -d ',' -f 4| tr -d '[:punct:]'| tr -d ' ')
latitude=$(cat data-hold/geocodes/$location.json| jq -r '.results[0] .geometry[]| .lat'|  grep -E "[[:digit:]]")
longitude=$(cat data-hold/geocodes/$location.json| jq -r '.results[0] .geometry[]| .lng'|  grep -E "[[:digit:]]")
pdfname=$(cat data-hold/csv/*|grep -E "$x" | cut -d ',' -f 1| tr -d '[:punct:]'| cut -c 24-)
txt=$(cat pdftxt/$pdfname.txt | tr '[:space:]' ' ')

printf '%s|%s|%s|%s|%s|%s|%s|%s|%s\n%s\n' "$case_number" "$date" "$location" "$status""$weapon" "$suspect" "$officers" "$grand_jury" "$latitude" "$longitude" "$txt"

done
