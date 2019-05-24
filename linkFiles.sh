#!/usr/bin/env bash

# FIXME: this should check to make sure in repo dir, or won't find files
# pwd gives me directory, but if I only want the last part?
currentDir=$(pwd)

echo "If have a local copy of the vimrc repo, use this to symlink to repo files. Warning: existing files will be replaced."
echo "FIXME this should check and see if the files are different before overwrite - warning!"
echo "run a diff on all included files - for now I removed the overwrite flag"
read -p "Do you want to continue? y/n: " -srn1 INPUT
case "$INPUT" in
y|Y) # yes
    ln -sf $currentDir/.vimrc ~/.vimrc
    ln -sf $currentDir/.gvimrc ~/.gvimrc
    ln -sf $currentDir/vimCheatSheet.md ~/.vim/vimCheatSheet.md
    ln -sf $currentDir/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
    ln -sf $currentDir/jareds-coffee.snippets ~/.vim/mySnips/.
    ln -sf $currentDir/jareds-shell.snippets ~/.vim/mySnips/.
    ln -sf $currentDir/more-shell.snippets ~/.vim/mySnips/.
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

# TODO: add a command to clear all of these files befor creating the links. This would allow one to link to vimrc project after the fact. 
