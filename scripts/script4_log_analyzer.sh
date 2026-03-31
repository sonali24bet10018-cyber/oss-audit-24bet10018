#!/bin/bash
# script 4: read logs and find keywords

log_file=$1
kw=${2:-"error"}

if [ -z "$log_file" ]; then
    echo "Usage: ./script4.sh <log_file> [keyword]"
    exit 1
fi

if [ ! -f "$log_file" ]; then
    echo "Error: can't find $log_file"
    exit 1
fi

# wait for the log file to actually have some content, retrying up to 3 times
retries=0
while true; do
    if [ -s "$log_file" ]; then
        break
    fi
    retries=$((retries + 1))
    echo "File is empty, retrying... ($retries/3)"
    if [ $retries -ge 3 ]; then
        echo "Gave up."
        exit 1
    fi
    sleep 2
done

count=0
echo "Searching for '$kw' in $log_file..."

# read the file line by line and count how many times our keyword pops up (case-insensitive)
while IFS= read -r line; do
    if echo "$line" | grep -iq "$kw"; then
        count=$((count + 1))
    fi
done < "$log_file"

echo "Found '$kw' $count times."

if [ $count -gt 0 ]; then
    echo ""
    echo "Last 5 matches:"
    grep -i "$kw" "$log_file" | tail -n 5 | while read -r match; do
        echo "  > $match"
    done
fi

echo ""
echo "Note: VLC logs its activity in ~/.local/share/vlc/vlc-qt-interface.log"
