
# skeleton basic-ifelse.sh
# if there are fewer than 1 arguments, i.e. 0
if [[ "$#" -lt 1 ]]; then
  echo "You need more than 0 argument"

elif [[ "$#" -eq 4 ]]; then
# just one argument 
  echo "You need fewer than 4 arguments"

elif [[ "$#" -eq 5 ]]; then

  echo "You need few than 5 arguments"

elif [[ $1 == '9' ]]; then

  echo "The only argument is 9"
fi

if [[ $# -eq 2 ]]; then
	echo "There's arguments"

elif [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"

elif  [[ $1 -lt $2 ]]; then
        echo "There are two arguments: $1 $2"
        echo "$1 is less than $2"

elif [[ $1 -gt $2 ]]; then
        echo "There are two arguments: $1 $2"
        echo "$1 is greater than $2"
fi

if [[ #$ -eq 3]];then
	echo "There are three arguments"
elif [[ $1 -eq $2 && $1 -eq $3 && $2 -eq $3 && $3 -eq $1 ]]; then
        echo "There are three statements: $1 $2 $3"
        echo "$1 is equal to $2 is equal to $3"

elif [[ $1 -eq $2 && $1 -gt $3 ]]; then
        echo "There are three statements: $1 $2 $3"
        echo "$1 is equal to $2 is greater than $3"

elif [[ $1 -eq $2 && $1 -lt $3 ]]; then
        echo "There are three statements: $1 $2 $3" 
        echo "$1 is equal to $2 is less than $3"

elif [[ $1 -lt $2 && $1 -lt $3 ]]; then
        echo "There are three statements: $1 $2 $3" 
        echo "$1 is less than $2 is less than $3"
fi
