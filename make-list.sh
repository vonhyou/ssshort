#!/bin/bash

file="./_redirects"
redirectList=""

while read -r line; do
    source=$(echo $line | awk '{print $1}')
    destination=$(echo $line | awk '{print $2}')
    code=$(echo $line | awk '{print $3}')
    redirectList="$redirectList<li>Source: $source Destination: $destination Code: $code</li>"
done < "$file"

html="<ul>$redirectList</ul>"
echo "$html"
