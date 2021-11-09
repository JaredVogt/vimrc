#!/usr/bin/env bash

# Grab my colorshemes
mkdir -p ~/.vim/colors && cd $_
git clone git://github.com/altercation/solarized.git
git clone https://github.com/srcery-colors/srcery-vim

# Grab my fav plugins
mkdir -p ~/.vim/pack/jared/start && cd $_
git clone https://github.com/jiangmiao/auto-pairs
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/haya14busa/incsearch.vim
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/junegunn/vim-easy-align
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/Xuyuanp/nerdtree-git-plugin
