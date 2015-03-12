for x in data-hold/pdfs/*; do
pdftotext -layout $x $x.txt
done
