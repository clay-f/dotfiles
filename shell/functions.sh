# help_do func
#
#  add helper function/stuff

#######################
# decompress file
# Globals:
#   None
# Arguments:
#   Reicve one parameter be decompress
# Rerurns:
#   None
#######################
extract_files() {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar -xvj -f $1    ;;
           *.tar.gz)    tar -xvz -f $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar -x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar -xv -f $1     ;;
           *.tbz2)      tar -xvj -f $1    ;;
           *.tgz)       tar -xvz -f $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }