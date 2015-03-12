mkdir -p data-hold/html
curl -s http://www.dallaspolice.net/ois/ois.html -o data-hold/html/ois.html

for x in $(seq 2003 2012)
do
curl -s "http://www.dallaspolice.net//ois/ois_$x.html" -o "data-hold/html/$x.html"
done

