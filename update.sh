#! /bin/bash
declare -a servers
servers=($(cat list))

for i in ${servers[@]}
do
	echo $i
done | nl -v 0

echo "----------------"
read -p "choose for updat: " choosenumber

s=${servers[choosenumber]}
echo $s

dirname=$(echo $s | sed -e 's_https\?://__g')

wget --no-check-certificate -e robots=off -A "*.html" -r -l 0 -p --convert-links --no-parent "$s"

sed -i -e "s_<!--REPLACE POSITION-->_\t<br>\n\t<a href=\"$dirname\">$dirname</a>\n<!--REPLACE POSITION-->_g" index.html