geodir="data-hold/geodata"
touch tables/geodata.psv
 printf 'location|latitude|longitude'
cat data-hold/html/*.html | pup 'table table tr json{}' | 
  jq  --raw-output '.[] .children | [ 
    .[0] .children[0] .href, 
    .[0] .children[0] .text, 
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv' |  csvfix order -smq -f 4 |  grep -v 'Location' | tr ' ' '+' |
  
  while read -r address; do
      
      fname=$(echo "$geodir/$address.json")
      oaddress=$(echo "$address" | tr '+' ' ')
  
  latitude=$(cat $fname| jq -r '.results[0] .geometry[]| .lat'|  grep -E "[[:digit:]]")
  longitude=$(cat $fname| jq -r '.results[0] .geometry[]| .lng'|  grep -E "[[:digit:]]")

 printf '%s|%s|%s\n' "$oaddress" "$latitude" "$longitude" >> tables/geodata.psv

 done
