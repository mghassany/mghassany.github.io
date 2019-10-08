#!/bin/sh

# sed -i 's/original/new/g' file.txt

file=$1

sed -i '/invités/,+1 d' "$file"
sed -i '/invités/d' "$file"
sed -i '/rmdreview/d' "$file"