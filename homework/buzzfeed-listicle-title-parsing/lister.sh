d_start='2014-01-01'
d_end='2014-12-31'
days_diff=$(( ( $(date -ud $d_end +'%s') - $(date -ud $d_start +'%s') )/ 60 / 60 / 24 ))

#Listicle tiles =  pup 'li.bf_dom a text{}'

for num in $(seq 0 $days_diff); do 
  # DO YOUR WORK HERE
  pup 'li.bf_dom a text{}'| 
  grep -oE '^[[:digit:]]+' |
  sort -rn | uniq -c

  date -d "$d_start $num days" +%Y-%m-%d
done
