cat data-hold/fdr.txt data-hold/fel1924_64.txt data-hold/felpresent.txt|
 pup 'td:nth-of-type(3) text{}' | 
grep -oE "[[:upper:]]{2}" |
sort |
sed 's/WM/White/' |
sed 's/BM/Black/'|
sed 's/OM/Other/'|
sed 's/WF/White/'|
sed 's/BF/Black/'|
sed 's/OF/Other/'
