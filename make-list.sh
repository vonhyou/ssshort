#!/bin/bash

file="./_redirects"
redirectList=""

while read -r line; do
  source=$(echo $line | awk '{print $1}')
  redirectList="$redirectList<li><a href=\"$source\">$source</a></li>"
done < "$file"

html="<ul>$redirectList</ul>"
echo "$html"
