#timeline script
username=$1
mkdir -p ./data-hold/
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"
file=data-hold/$username-timeline.csv
t timeline -n 3200 --csv $username > $file
count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)

# Echoing some stats about the tweets
echo "Analyzing $count tweets by $1 since $lastdate"
#top hashtags
echo "Top 10 hashtags by $username"
csvfix order -smq -fn Text $file | 
grep -oiE '#[[:alpha:]]+' | sort | uniq -c | sort -rn | head -n 10

#top users
echo "Top 10 retweeted users by $username"
csvfix order -smq -fn Text $file |
grep -E 'RT' | grep -ioE "RT.@[[:alpha:]]+" | cut -c 4- | sort | uniq -c | sort -rn | head -n 10

#top users mentioned in tweets
echo "Top 10 mentioned users (not including retweets) by $username"
csvfix order -smq -fn Text $file |
grep -vE 'RT' | grep -ioE "@[[:alpha:]]+" | sort | uniq -c | sort -rn | head -n 10

# top tweeted 10 words with 5+ letters
echo "Top tweeted 10 words with 5+ letters by $username"
csvfix order -smq -fn Text $file | grep -ioE "[[:alpha:]]{5,}" | grep -vE "$username" | sort | uniq -c | sort -rn | head -n 10

