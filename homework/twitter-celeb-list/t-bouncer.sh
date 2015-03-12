cat $1 |
    csvfix find -f 11 -s 'true' |
    csvfix find -if '$8 > 50000' |
    csvfix find -if '$7 < 1000' | 
    csvfix find -if '$5 < 1000' | csvfix order -smq -f 9 | 
    

while read -r username; do

if [[ $users_fetched -lt 15 ]]; then    
    lowercase_name=$(echo $username | tr '[:upper:]' '[:lower:]')
    filename="data-hold/followings/$lowercase_name.csv"
    if [[ -s "$filename" ]]; then
      echo "Already have followings-list for $lowercase_name"
    else
      echo "Getting followings for $lowercase_name; $users_fetched users fetched so far"      # run your code to execute the appropriate t program and save the data
     echo "downloading $username to $filename"
       t followings "$username"> "$filename"
      # ...
      # instead of sleeping for 60 seconds, just move on to the
      # next username...let whatever calls `t-bouncer.sh` do the 
      # necessary sleeping
      users_fetched=$((users_fetched + 1))
    fi
  fi
done

