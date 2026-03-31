#!/bin/bash
# script 5: generate a personalized open source manifesto

echo "Manifesto Generator"
echo "==================="

read -p "1. Name an open source tool you use often: " tool
read -p "2. Describe 'freedom' in one word: " freedom
read -p "3. What would you build and share freely? " build

# make sure the user didn't just hit enter without typing anything
if [ -z "$tool" ] || [ -z "$freedom" ] || [ -z "$build" ]; then
    echo "Please answer all the prompts!"
    exit 1
fi

user=$(whoami)
date_str=$(date '+%d %b %Y')
fname="manifesto_${user}.txt"

# create a new file (or overwrite if it exists) and start dumping the manifesto text into it
echo "Open Source Manifesto" > "$fname"
echo "Author: $user" >> "$fname"
echo "Date: $date_str" >> "$fname"
echo "------------------------" >> "$fname"
echo "" >> "$fname"
echo "I rely on $tool on a daily basis. It was built by folks who chose to share their code instead of hiding it." >> "$fname"
echo "" >> "$fname"
echo "To me, freedom is $freedom. Software freedom allows anyone to learn and improve tools." >> "$fname"
echo "" >> "$fname"
echo "If I could build something to give back, it would be $build." >> "$fname"
echo "Sharing knowledge is how we build a better world." >> "$fname"

echo ""
echo "Done. Saved to $fname."
echo "Here is your manifesto:"
echo ""
cat "$fname"
