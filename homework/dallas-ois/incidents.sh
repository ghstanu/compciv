table="tables/geodata2.psv"
printf 'case_number|date|location|suspect_status|weapon|suspects|officers|grand_jury|latitude|longitude|narrative\n'

cat data-hold/csv | sed '1d' | while read -r x; do

case_number=$(echo "$x" | grep -v 'case' | csvfix order -smq -f 2)  
date=$(echo "$x" | csvfix order -smq -f 3)
status=$(echo "$x" | csvfix order -smq -f 4)
weapon=$(echo "$x" | csvfix order -smq -f 5)
suspect=$(echo "$x" | csvfix order -smq -f 6| tr -d '"')
officers=$(echo "$x"| csvfix order -smq -f 7| tr -d '"')
grand_jury=$(echo "$x"| csvfix order -smq -f 8| tr -d '"')

address=$(echo "$x"| csvfix order -smq -f 4)
location=$(cat $table | grep "$address" | csvfix order -smq -f 1)
latitude=$(cat $table | grep "$address" | csvfix order -smq -f 2)
longitude=$(cat $table | grep "$address" | csvfix order -smq -f 3)

pdfname=$(echo "$x" | csvfix order -smq -f 1| tr -d '[:punct:]'| cut -c 24-)
 
txt=$(cat data-hold/pdftxt/$pdfname.txt | tr '[:space:]' ' ')

printf '%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s\n' "$case_number" "$date" "$location" "$status" "$weapon" "$suspect" "$officers" "$grand_jury" "$latitude" "$longitude" "$txt" 

done
