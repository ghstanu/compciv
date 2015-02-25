cat data-hold/ca.txt |
 grep -oE 'Living..............' | 
grep -oE '\b[[:upper:]]{3}\b' |
sed 's/BLA/Black/'|
sed 's/WHI/White/'| 
sed 's/HIS/HISPANIC/'| 
sed 's/OTH/Other/'
