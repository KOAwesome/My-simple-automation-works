#!/bin/bash

# Base URL
base_url="https://rebrand.ly/"

# Loop through the alphabet from "a" to "z"
for i in {1..9} {a..z}
do
  # Loop through the alphabet from "a" to "z" again
  for j in {1..9} {a..z}
  do
    # Construct the full URL
    url="${base_url}${i}${j}"

    # Send a GET request to the URL and check the HTTP status code
    response=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "${url}")

    # Check if the status code is 404 Not Found, which means the domain is available
    if [ "${response}" == "404" ]; then
        echo "${url} is available"
    else
        echo "${url} is not available"
    fi
  done
done
