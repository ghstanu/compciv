x=$1
y=$2
cat "data-hold/names-nationwide/yob$x.txt" | cut -d ',' -f 1,2 > "data-hold/lost$x.txt"
cat "data-hold/names-nationwide/yob$y.txt" | cut -d ',' -f 1,2 > "data-hold/lost$y.txt" 

grep -Ff "data-hold/lost$y.txt" -v "data-hold/lost$x.txt" | sort
