# require source files
# add utility functions, tools

for file in ~/.{path_exports,aliases,functions}.sh; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file