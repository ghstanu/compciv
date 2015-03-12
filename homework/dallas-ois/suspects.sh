printf 'case_number|date|weapon|first_name|last_name\n'

cat suspects.txt| grep -v 'suspects'|grep -v "^[[:space:]]*$"|

 while read -r x; do


case_number=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 2| sort)  
date=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 3)


weapon=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 6| sort)

first_name=$(echo $x | csvfix order -smq -f 1| sort )

last_name=$(echo $x | csvfix order -smq -f 2 | grep -oE '[[:alnum:]]{3,}'| sort)




printf '%s|%s|%s|%s|%s\n' "$case_number" "$date" "$weapon" "$last_name" "$first_name"


done
