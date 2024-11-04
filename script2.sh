#!/bin/bash

# Ynha pr mujhe check krna pdega ki curl or jq install hai ya nahi
if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null; then
    echo "This script requires 'jq' and 'curl' to be installed."
    sudo apt-get install jq curl
    exit 1
fi

# arguments lene padenge search term
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <search-term>"
    exit 1
fi

SEARCH_TERM="$1"


temp=$(echo "$SEARCH_TERM" | sed 's/ /%20/g')
response=$(curl -s "https://en.wikipedia.org/w/api.php?action=query&list=search&format=json&srsearch=${temp}")

if echo "$response" | grep -q '"totalhits":0'; then
    echo "Sorry :( No result found '$SEARCH_TERM'."
    exit 1
fi


total_hits=$(echo "$response" | jq '.query.searchinfo.totalhits')
echo "Found $total_hits results for '$SEARCH_TERM'."


page_show=5
page=1
totalpage=$((($total_hits + $page_show - 1) / $page_show))

display_results() {
    echo "Showing results $((($page - 1) * $page_show + 1)) to $((page * $page_show)):"
    echo "$response" | jq -r ".query.search[$((($page - 1) * $page_show)):$(($page * $page_show))] | .[] | \"\(.title): \(.snippet | gsub(\"<[^>]*>\"; \"\"))\""
}

while true; do
    display_results
    echo "Page $page of $totalpage."
    if [ $page -lt $totalpage ]; then
        echo "Enter p : for previous page , n: for next page , q: EXIT"
    else
        echo "Enter p : for previous page , q:EXIT"
    fi

    read -r -p "> " choice

    if [ "$choice" = "n" ] && [ $page -lt $totalpage ]; then
        page=$((page + 1))
    elif [ "$choice" = "p" ] && [ $page -gt 1 ]; then
        page=$((page - 1))
    elif [ "$choice" = "q" ]; then
        exit 0
    else
        echo "Invalid choice."
    fi
done
