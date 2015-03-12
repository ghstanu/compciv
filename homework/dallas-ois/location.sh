baseurl="https://maps.googleapis.com/maps/api/geocode/json?address="
geodir="data-hold/geodata"
mkdir -p $geodir


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

      url=$(echo "$baseurl$address+Dallas+TX")
      fname=$(echo "$geodir/$address.json")
     
# if file exists and is non-zero
# then we don't need to download it
if [[ -s "$fname" ]]; then
  echo "Already downloaded $fname"
else
  echo "Going to geocode the $url into $fname"
  curl "$url" -o "$fname"
fi

 done
