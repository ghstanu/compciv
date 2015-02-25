for name in $@;
do


if [[ "$#" -lt 1 ]]; then
  echo "Please pass in at least one name"
fi


datafile='data-hold/namesample.txt'
name_matches=$(cat $datafile | grep "$name,")

if [[ ! -z "$names_matches" ]];
then
        echo "$name,NA,0,0"
fi

m_count=0
f_count=0


for row in $name_matches; do

babies=$(echo $row | cut -d ',' -f '3')



if [[ $row =~ ',M,' ]];
    then    

    m_count=$((m_count + babies))
elif [[ $row =~ ',F,' ]];
        then
        f_count=$((f_count + babies))

else

total_number="0"
g_and_pct="NA,0"

fi

done
 

total_babies=$((m_count + f_count))

if [[ $total_babies -le 1 ]]; then
g_and_pct="NA,0"

fi

if [[  m_count -gt 0 || f_count  -gt 0 ]]; then

pct_female=$((100 * f_count / total_babies))
pct_male=$((100 * m_count / total_babies))

fi


# If the percentage is greater to or equal to 50

if [[ $pct_female -ge 50 ]]; then
  g_and_pct="F,$pct_female"
elif [[ $pct_male -ge 50 ]]; then
        g_and_pct="M,$pct_male"
 
fi


echo "$name,$g_and_pct,$total_babies"

done
