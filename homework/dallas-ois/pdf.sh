mkdir -p data-hold/pdfs data-hold/pdftxt

cat pdf.txt | while read -r x; do 
rawsite=$(echo $x | tr -d '"')
fname=$(echo $rawsite | tr -d '[:punct:]'| cut -c 24-)

curl "http://www.dallaspolice.net$rawsite" -s -o "data-hold/pdfs/$fname"
done

