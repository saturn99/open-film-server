#!/bin/bash

#add customlinks file in root directory
#run bash customlins.sh FOLDER_NAME
#add/change folder to index.html

filename="customlinks"
dirname=${1:?"set dirname"}

bash wgetcon.sh -i $dirname/$filename

find $dirname  -type d  | 
   rush -d $'\n' '[ -f "{}/index.html" ] || echo "{}"' |
   while read d 
   do
   		ls -1 "$d" | 
   		   while read files
   		   do
   		   	    esc_files=$(echo $files | sed -e "s_'_\&#039;_g")
   		   		echo  "<a href='$esc_files'>$esc_files</a> </br>"
   		   done > "$d/index.html"
   done

echo "ok"
echo "please manual change root index.html"