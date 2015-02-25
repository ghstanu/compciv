x=$1
y=$2
cat "data-hold/names-by-state/$x.TXT" | grep -E "$y" | cut -d ',' -f 2,4,5
