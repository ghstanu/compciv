cat > officers.html <<'EOF'

<html>
<head>
<title>PSV Tables</title>
</head>
<body>
<table border="1">
<tr>
#headers
<th>case_number</th>
<th>date</th>
<th>suspect_status</th>
<th>weapon</th>
<th>last_name</th>
<th>first_name</th>
<th>race</th>
<th>gender</th>
</tr>

EOF

read -r -d '' aimg_code <<'EOF'
<tr>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
</tr>
EOF

cat tables/officers.psv| while read -r row; do
	case_number=$(echo $row |  cut -d '|' -f 1)
	date=$(echo $row |  cut -d '|' -f 2)

	status=$(echo $row |  cut -d '|' -f 3)
	weapon=$(echo $row | cut -d '|' -f 4)
	last_name=$(echo $row |  cut -d '|' -f 5)
	first_name=$(echo $row |  cut -d '|' -f 6)
	race=$(echo $row |  cut -d '|' -f 7)

	gender=$(echo $row |  cut -d '|' -f 8)
	printf "$aimg_code" $case_number $date $status $weapon $last_name $first_name $race $gender  >> officers.html

done

