cat > suspects.html <<'EOF'

<html>
<head>
<title>PSV Tables</title>
</head>
<body>
<table border="1">

<tr>
<th>case_number</th>
<th>date</th>
<th>weapon</th>
<th>last_name</th>
<th>first_name</th>
</tr>

EOF

read -r -d '' aimg_code <<'EOF'
<tr>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
<td>%s</td>
</tr>
EOF

cat tables/suspects.psv| while read -r row; do
	case_number=$(echo $row |  cut -d '|' -f 1)
	date=$(echo $row |  cut -d '|' -f 2)

	status=$(echo $row |  cut -d '|' -f 3)
	weapon=$(echo $row | cut -d '|' -f 4)
	last_name=$(echo $row |  cut -d '|' -f 5)
	first_name=$(echo $row |  cut -d '|' -f 6)

	printf "$aimg_code" $case_number $date $weapon $last_name $first_name  >> suspects.html

done

