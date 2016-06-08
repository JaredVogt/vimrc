" NOTE: to source this file ':so %'
" to load plugins ':PlugInstall'
" This file is symlinked for use in neovim `ln -s ~/.vim ~/.config/nvim` and `ln -s ~/.vimrc ~/.config/nvim/init.vim`


" ------------------------------------------------------------------------------
" Bootstrap Section - required files (vim-plug, monokai, my personal snippets)
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/plugged/vim-snippets/UltiSnips/jareds-shell.snippets'))
  silent !curl -fLo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-shell.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-shell.snippets
endif

if empty(glob('~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets'))
  silent !curl -fLo ~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-coffee.snippets
endif

if empty(glob('~/.vim/colors/monokai.vim'))
  silent !curl -fLo ~/.vim/colors/monokai.vim --create-dirs https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" ------------------------------------------------------------------------------
" Variable Section
" ------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1  "https://medium.com/@ericclifford/neovim-item2-truecolor-awesome-70b975516849#.cs5m1w41p


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
syntax enable
colorscheme monokai
set background=dark
set relativenumber  "set nornu to turn off
set nu  "this shows you the current line number in relative mode

" tab settings
set shiftwidth=2
set softtabstop=2
set expandtab

" setup the cross hairs
hi CursorLine   cterm=NONE ctermbg=black guibg=black guifg=white  "ctermfg=lightblue  this option overrides the colors on highlighted characters - disconcerting, but distinct
hi CursorColumn cterm=NONE ctermbg=black guibg=black guifg=white

set cursorline cursorcolumn

" ------------------------------------------------------------------------------
" Call vim-plug Section
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
Plug 'airblade/vim-gitgutter'  "NOTE: might have to turn this on `:GitGutterEnable`

call plug#end()


" ------------------------------------------------------------------------------
" General shortcuts Section
" ------------------------------------------------------------------------------
imap jj <Esc>  " for situations where capslock isn't remapped
nmap cc gcc " remap commentary, just quicker
vmap cc gc " remap commentary to be the same in visual mode, just quicker
map dw daw
map cw ciw
nnoremap <expr> n  'Nn'[v:searchforward]  "saner n, N - https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> N  'nN'[v:searchforward]

nmap <CR> O<Esc>  "newline in normal mode - http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode


" ------------------------------------------------------------------------------
" UltiSnips Section
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
imap <tab><tab> <C-J>  "when tab is interpreted literally, this can work
autocmd FileType coffee UltiSnipsAddFiletypes jareds-coffee  "this loads up snippets in ~/.vim/plugged/vim-snippets/UltiSnips/jareds-coffee.snippets and associates with coffee files
autocmd FileType sh UltiSnipsAddFiletypes jareds-shell

