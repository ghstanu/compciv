Fam=$(hxselect -c -s '\n' '#OccupationSeriesFamily JobFamily' < data-hold/OccupationalSeries.xml)


# data-hold/scrapes/YYYY=MM-DD_HH00
d=($(date -I))
mkdir -p   ./data-hold/scrapes/$d
cd ./data-hold/scrapes/$d
for x in $Fam; do
   fname="$x-1.json"
   curl "https://data.usajobs.gov/api/jobs?NumberOfJobs=250&series=$x"  -so $fname

    
   y=$(cat $fname | jq --raw-output '.Pages')

   for num in $(seq 2 $y); do
      gname="$x-$num.json"
      curl "https://data.usajobs.gov/api/jobs?NumberOfJobs=250&series=$x&Page=$num" -o $gname 
   done
done

cd ..
