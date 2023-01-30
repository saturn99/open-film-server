#!/bin/bash

SEARCH_PATH=${1:?"Please Set SEARCH_PATH"}

ORIGIN_STR=${2:?"Please set string for must be replace"}
REPLACE_NAME=${3:?"Please set replace name"}


find "$SEARCH_PATH" -type f | \
while read file
do
	sed -i -e "s_"$ORIGIN_STR"_"$REPLACE_NAME"_g" "$file"
done

echo "**************************"
echo "**************************"
echo "**************************"
echo "** 1. change folder's   **"
echo "** 2. change index.html **"
echo "**************************"
echo "**************************"
echo "**************************"


