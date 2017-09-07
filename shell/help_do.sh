# require source files
# add utility functions, tools

for file in ~/.{aliases,functions,exports}.sh; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

vscode() { open -a Visual\ Studio\ Code "$1"; }
