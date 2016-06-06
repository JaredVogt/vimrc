syntax enable 
colorscheme monokai

call plug#begin('~/.vim/plugged')  # https://github.com/junegunn/vim-plug

Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'

call plug#end()


" Leader Keys
" ------------------------------------------------------------------------------
" use spacebar for leader! (does this only work on OSX?)
let mapleader = "\<Space>"  

" \q ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" \q! ever so slightly faster quit command w/! override
nnoremap <Leader>yq :q!<CR>

" \w ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" \x ever so slightly faster x command
nnoremap <Leader>x :x<CR>
