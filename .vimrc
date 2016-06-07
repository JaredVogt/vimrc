" NOTE: to source this file ':so %'
" to load plugins ':PlugInstall'

" ------------------------------------------------------------------------------
" Variable section
" ------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1  "https://medium.com/@ericclifford/neovim-item2-truecolor-awesome-70b975516849#.cs5m1w41p

" ------------------------------------------------------------------------------
" Basic settings section
" ------------------------------------------------------------------------------
syntax enable
colorscheme monokai
set relativenumber  "set nornu to turn off
set nu  "this shows you the current line number in relative mode

" tab settings
set shiftwidth=2
set softtabstop=2
set expandtab

" setup the cross hairs
hi CursorLine   cterm=NONE ctermbg=black ctermfg=lightblue guibg=black guifg=white
hi CursorColumn cterm=NONE ctermbg=black ctermfg=lightblue guibg=black guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>  "FIXME: this doesn't appear to be working
set cursorline cursorcolumn

" ------------------------------------------------------------------------------
" Call vim-plug section
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')  "https://github.com/junegunn/vim-plug

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
Plug 'tpope/vim-commentary'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'  "https://github.com/majutsushi/tagbar
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'  "NOTE: I had to manually copy gruvbox.vim to ~/.vim/colors/. to get it to work... strange
Plug 'airblade/vim-gitgutter'


call plug#end()


" ------------------------------------------------------------------------------
" General shortcuts section
" ------------------------------------------------------------------------------
imap jj <Esc>  " for situations where capslock isn't remapped
nmap cc gcc " remap commentary, just quicker
vmap cc gc " remap commentary to be the same in visual mode, just quicker
map dw diw
map cw ciw

nnoremap <expr> n  'Nn'[v:searchforward]  "saner n, N - https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> N  'nN'[v:searchforward]

nmap <CR> O<Esc>  "newline in normal mode - http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode


" ------------------------------------------------------------------------------
" Leader Keys section
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

"select word under cursor and prep for replace
nnoremap <Leader>r *:%s//

