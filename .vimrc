" NOTE: to source this file ':so %'
" to load plugins ':PlugInstall'
" This file is symlinked for use in neovim `ln -s ~/.vim ~/.config/nvim` and `ln -s ~/.vimrc ~/.config/nvim/init.vim`


" ------------------------------------------------------------------------------
" Bootstrap Section - required files (vim-plug, monokai)
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/colors/monokai.vim'))
  silent !curl -fLo ~/.vim/colors/monokai.vim --create-dirs https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
endif

" https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" ------------------------------------------------------------------------------
" Variable Section
" ------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"https://medium.com/@ericclifford/neovim-item2-truecolor-awesome-70b975516849#.cs5m1w41p


" ------------------------------------------------------------------------------
" Leader Section (I think you have to mapleader before you can define <Leader> shortcuts - so doing it at the top)
" ------------------------------------------------------------------------------
" use spacebar for leader! (does this only work on OSX?)
let mapleader = "\<Space>"

" turn cursor lines on/off
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" \q ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" \q! ever so slightly faster quit command w/! override (this is dangerous, will make this something that requires attention)
" nnoremap <Leader>yq :q!<CR>

" \w ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" \x ever so slightly faster x command
nnoremap <Leader>x :x<CR>

"select word under cursor and prep for replace - http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor NOTE: <Left> kicks the cursor back to left
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>


" ------------------------------------------------------------------------------
" Basic settings Section
" ------------------------------------------------------------------------------
" Necessary  for lots of cool vim things
set nocompatible

" show what my commands are
set showcmd

syntax enable
colorscheme monokai
set background=dark

"set nornu to turn off
set relativenumber

"this shows you the current line number in relative mode
set nu

" tab settings
set shiftwidth=2
set softtabstop=2
set expandtab

" setup the cross hairs
hi CursorLine   cterm=NONE ctermbg=black guibg=black guifg=white
hi CursorColumn cterm=NONE ctermbg=black guibg=black guifg=white
set cursorline cursorcolumn

"ctermfg=lightblue  this is option to above that overrides the colors on highlighted characters - disconcerting, but distinct


" ------------------------------------------------------------------------------
" Call vim-plug Section
" ------------------------------------------------------------------------------


call plug#begin('~/.vim/plugged')  "https://github.com/junegunn/vim-plug

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
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
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

call plug#end()

"NOTE: I had to manually copy gruvbox.vim to ~/.vim/colors/. to get it to work... strange


" ------------------------------------------------------------------------------
" General shortcuts Section
" ------------------------------------------------------------------------------
" for situations where capslock isn't remapped
imap jj <Esc>

" remap vim-commentary, just quicker
nmap cc gcc

" remap vim-commentary to be the same in visual mode, just quicker
vmap cc gc

map dw daw
map cw ciw

"saner n, N - https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

"newline in normal mode - http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nmap <CR> O<Esc>


" ------------------------------------------------------------------------------
" UltiSnips Section
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
imap <tab><tab> <C-J>  "when tab is interpreted literally, this can work

"this loads up snippets in ~/.vim/plugged/vim-snippets/UltiSnips/jareds-x.snippets and associates with x files
autocmd FileType coffee UltiSnipsAddFiletypes jareds-coffee
autocmd FileType sh UltiSnipsAddFiletypes jareds-shell


" ------------------------------------------------------------------------------
" Load My Snippets Section (TODO: this could be a whole repo that is pulled in) FIXME: its broken in general right now
" ------------------------------------------------------------------------------
"if empty(glob('~/.vim/plugged/vim-snippets/UltiSnips/jareds-shell.snippets'))
"  silent !curl -fLo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-shell.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-shell.snippets
"endif

"if empty(glob('~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets'))
"  silent !curl -fLo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-coffee.snippets
"endif


" ------------------------------------------------------------------------------
" Insperation Section
" ------------------------------------------------------------------------------
"https://gist.github.com/aflock/6500273


