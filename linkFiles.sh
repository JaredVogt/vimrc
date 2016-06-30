#!/usr/bin/env bash

# FIXME: this should check to make sure in repo dir, or won't find files
# pwd gives me directory, but if I only want the last part?
currentDir=$(pwd)

echo "If have a local copy of the vimrc repo, use this to symlink to repo files. Warning: existing files will be replaced."
read -p "Do you want to continue? y/n: " -srn1 INPUT
case "$INPUT" in
y|Y) # yes
    ln -sf $currentDir/.vimrc ~/.vimrc
    ln -sf $currentDir/.gvimrc ~/.gvimrc
    ln -sf $currentDir/vimCheatSheet.md ~/.vim/vimCheatSheet.md
    echo -e "\nexecuting"
    ;;
n|N) # no
    echo -e "\ncancelled"
    exit
    ;;
*) # all other cases
    echo -e "\nERROR: $INPUT is not a valid entry" 
    exit
    ;;
esac


