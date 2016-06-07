#!/usr/bin/env bash
GITRAW="https://raw.githubusercontent.com"
GITRAWVIMRC="$GITRAW/JaredVogt/vimrc/master"
SNIPDIR="~/.vim/plugged/vim-snippets/UltiSnips"

curl -Lo ~/.vim/autoload/plug.vim --create-dirs $GITRAW/junegunn/vim-plug/master/plug.vim
curl -Lo ~/.vim/colors/monokai.vim --create-dirs $GITRAW/sickill/vim-monokai/master/colors/monokai.vim
curl -O $GITRAW/JaredVogt/vimrc/master/.vimrc

# load up all my snippets
curl -Lo $SNIPDIR/jareds-shell.snippets --create-dirs $GITRAWVIMRC/jareds-shell.snippets
curl -Lo $SNIPDIR/jareds-coffee.snippets --create-dirs $GITRAWVIMRC/jareds-coffee.snippets
