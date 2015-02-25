cat data-hold/ca.txt |
 grep -oE 'Living..............' | 
grep -oE '\b[[:upper:]]{3}\b' 
