if [[ "$#" -lt 1 ]]; then
  echo "Please pass in at least one name"
fi

for name in $@;
do
datafile='data-hold/namesample.txt'
name_matches=$(cat $datafile | grep "$name,")
m_count=0
f_count=0

for row in $name_matches; do

babies=$(echo $row | cut -d ',' -f '3')


if [[ $row =~ ',M,' ]];
    then    

    m_count=$((m_count + babies))

    else

    f_count=$((f_count + babies))
fi



done 

fi


total_babies=$((m_count + f_count))

if [[ $m_count -eq 0 && $f_count -eq 0 ]]; then
    pct_female='0'
    pct_male='0'
    g_and_pct="NA,0"
    name="$name,"
        total_babies="0"
else

pct_female=$((100 * f_count / total_babies))
pct_male=$((100 * m_count / total_babies))
# If the percentage is greater to or equal to 50
if [[ $pct_female -ge 50 ]]; then
  g_and_pct="F,$pct_female"
else
        g_and_pct="M,$pct_male" 
fi



echo "$name,$g_and_pct,$total_babies"

done
