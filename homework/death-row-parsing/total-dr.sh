for x in $(bash ca-dr2.sh)
do
echo "CA,$x"
done

for y in $(bash fl-dr2.sh)
do 
echo "FL,$x"
done

for n in $(bash tx-dr.sh)
do 
echo "TX,$n"
done

