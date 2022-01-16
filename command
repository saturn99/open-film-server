# find -maxdepth 1 -type d -printf "%P\n" | grep -vP "^\.|^\s*$" > list

# update:
# wget -e robots=off -A "*.html" -r -l 0 -p --convert-links --no-parent -i list

# wget -e robots=off -A "*.html" -r -l 0 -p --convert-links --no-parent "sites links"
