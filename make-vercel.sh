#!/bin/bash

redirects=()

while read line; do
  parts=($line)
  source=${parts[0]}
  destination=${parts[1]}
  status_code=${parts[2]}
  if [ $status_code -eq 302 ]; then
    permanent=false
  else
    permanent=true
  fi
  redirects+=($(printf '{"source":"%s","destination":"%s","permanent":%s}' "$source" "$destination" "$permanent"))
done < _redirects

json=$(printf '{"redirects":[%s]}' "$(IFS=, ; echo "${redirects[*]}")")

echo $json | jq > vercel.json