#!/usr/bin/env bash
GITRAW="https://raw.githubusercontent.com"
# GITRAWVIMRC="$GITRAW/JaredVogt/vimrc/master"
# SNIPDIR="~/.vim/plugged/vim-snippets/UltiSnips"

curl -Lo ~/.vim/autoload/plug.vim --create-dirs $GITRAW/junegunn/vim-plug/master/plug.vim
curl -Lo ~/.vim/colors/monokai.vim --create-dirs $GITRAW/sickill/vim-monokai/master/colors/monokai.vim
curl -O $GITRAW/JaredVogt/vimrc/master/.vimrc

# load up all my snippets
curl -Lo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-shell.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-shell.snippets
curl -Lo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-coffee.snippets
