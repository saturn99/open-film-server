# find -maxdepth 1 -type d -printf "%P\n" | grep -vP "^\.|^\s*$" > list

# update:
# wget -A "*.html" -r -p --convert-links --no-parent -i list

# wget -A "*.html" -r -p --convert-links --no-parent "sites links"
