cat > incidents.html <<'EOF'

<html>
<head>
<title>PSV Tables</title>
</head>

<body>
<table border="1">

<tr>
<th>case_number</th>
<th>date</th>
<th>location</th>
<th>suspect_status</th>
<th>weapon</th>
<th>suspects</th>
<th>officers</th>
<th>grand_jury</th>
<th>latitude</th>
<th>longitude</th>
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
<td>%s</td>
<td>%s</td>

</tr>

EOF

cat data-hold/incidents.psv|sed '1d'| while read -r row; do
	case_number=$(echo $row |  cut -d '|' -f 1)
	date=$(echo $row |  cut -d '|' -f 2)
	location=$(echo $row |  cut -d '|' -f 3)

	status=$(echo $row |  cut -d '|' -f 4)
	weapon=$(echo $row | cut -d '|' -f 5)
	suspect=$(echo $row |  cut -d '|' -f 6)
	officers=$(echo $row |  cut -d '|' -f 7)
	grand_jury=$(echo $row |  cut -d '|' -f 8)

	latitude=$(echo $row |  cut -d '|' -f 9)
	longitude=$(echo $row |  cut -d '|' -f 10)
#	narrative=$(echo $row | cut -d '|' -f 11)
	printf "$aimg_code" $case_number $date $location $status $weapon $suspect $officers $grand_jury $latitude $longitude  >> incidents.html

done

