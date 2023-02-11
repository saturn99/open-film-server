#! /bin/bash
declare -a servers
servers=($(cat list))

for i in ${servers[@]}
do
	echo $i
done | nl -v 0

echo "----------------"
read -p "choose for updat: " choosenumber
read -p "update index.html [y,N]: " updateindex

folder_root="."

if echo ${servers[choosenumber]} | grep -q ",\*"
then
	updateindex="n" #set default to no
	etc_folder=$(echo ${servers[choosenumber]} | cut -d "," -f 2 | tr -d "*")
	folder_root="etc/${etc_folder}"
	mkdir -p $folder_root
fi

s=$(echo ${servers[choosenumber]} | cut -d "," -f 1)
echo $s

dirname=$(echo $s | sed -e 's_https\?://__g')

/bin/bash wgetcon.sh $s -P $folder_root

if [ ${updateindex:-"n"} == "y" ]
then
	sed -i -e "s_<!--REPLACE POSITION-->_\t<br>\n\t<a href=\"$dirname\">$dirname</a>\n<!--REPLACE POSITION-->_g" index.html
fi