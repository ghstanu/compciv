cat data-hold/fdr.txt data-hold/fel1924_64.txt data-hold/felpresent.txt|
 pup 'td:nth-of-type(3) text{}' | grep -oE "[[:upper:]]{2}" | sort
