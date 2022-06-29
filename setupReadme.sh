#!/bin/sh

MODLIST=$(packwiz list)
BASE_README=$(cat README_BASE.md)

echo "$BASE_README" > README.md
# Replace [MODLIST] in README.md with the list of mods
echo "$MODLIST" | sed -e 's/^/\* /' -e 's/$/\n/' >> README.md
