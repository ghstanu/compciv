printf 'case_number|date|suspect|status|weapon|first_name|last_name|race|gender\n'

cat officers.txt| grep -v 'Officer'| grep -v "^[[:space:]]*$" | 

while read -r x; do


case_number=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 2)  
date=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 3)
status=$(cat data-hold/csv| grep -E "$x" | csvfix order -smq -f 5)

	if [[ $status =~ 'Deceased' ]]
	
	then
	suspect_killed='True'
	else
	suspect_killed='False'
fi

weapon=$(cat data-hold/csv | grep -E "$x" | csvfix order -smq -f 6)

first_name=$(echo $x | csvfix order -smq -f 1)

last_name=$(echo $x | csvfix order -smq -f 2 | grep -oE '[[:alnum:]]{3,}')


race=$(echo $x | grep -oE '[[:alpha:]]/[[:alpha:]]' | cut -d '/' -f 1)
gender=$(echo $x | grep -oE '[[:alpha:]]/[[:alpha:]]' | cut -d '/' -f 2)



printf '%s|%s|%s|%s|%s|%s|%s|%s\n' "$case_number" "$date" "$suspect_killed" "$weapon" "$last_name" "$first_name" "$race" "$gender"


done
