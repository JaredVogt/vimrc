" NOTE: to source this file ':so %'
" NOTE: reload vimrc for all files?
" to load plugins ':PlugInstall'
" symlink for use in neovim `ln -s ~/.vim ~/.config/nvim` and `ln -s ~/.vimrc ~/.config/nvim/init.vim`


" ------------------------------------------------------------------------------
" Bootstrap Section - required files (vim-plug)
" ------------------------------------------------------------------------------
" NOTE: https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall | source $MYVIMRC
endif


" ------------------------------------------------------------------------------
" Variable Section
" ------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1  "https://medium.com/@ericclifford/neovim-item2-truecolor-awesome-70b975516849#.cs5m1w41p


" ------------------------------------------------------------------------------
" Basic settings Section
" ------------------------------------------------------------------------------
set history=1000            " remember more commands and search history
set undolevels=1000         " use many muchos levels of undo
set visualbell              " don't beep
set noerrorbells            " don't beep
set nocompatible            " Necessary for lots of cool vim things
set showcmd                 " show what my commands are
set relativenumber          " NOTE: `set nornu` to turn off
set nu                      " this shows you the current line number in relative mode
set clipboard=unnamed       " yank to system clipboard
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch                " highlight search terms  NOTE: in sensible
set incsearch               " show search matches as you type  NOTE: in sensible
set ww=<,>,h,l              " wrap lines with movement keys
"set list                    " show characters  FIXME: like to show trailing spaces but NOT newlines
set wildmenu                " autocompletion  NOTE: in sensible
au FocusLost * silent! wa   " Auto save buffers whenever you lose focus
set autowriteall            " Auto save buffers when you switch context
set lcs+=trail:·            " show trailing spaces
set undofile                " Maintain undo history between sessions NOTE: requires path to be set

" Needed for Syntax Highlighting and stuff (NOTE: http://stackoverflow.com/questions/5602767/why-is-vim-not-detecting-my-coffescript-filetype)
filetype on
filetype plugin on
filetype indent on
syntax enable

" vim-session settings
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

colorscheme molokai_dark
set background=dark

" tab settings
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab                " insert tabs on the start of a line according to shiftwidth, not tabstop

" setup the cross hairs
hi CursorLine   cterm=NONE ctermbg=black guibg=#330000 guifg=white  "ctermfg=lightblue  this is option to above that overrides the colors on highlighted characters - disconcerting, but distinct
hi CursorColumn cterm=NONE ctermbg=black guibg=#330000 guifg=white
set cursorline cursorcolumn

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.DS_Store$', '.swp', 'sublime-workspace', 'sublime-project']


" automatic switching back to normal mode
" au FocusLost * stopinsert   " switch back to normal on change of focus (FIXME: there is issue here... )
au FocusLost * call feedkeys("\<C-\>\<C-n>")  " this looks like it might solve problem per http://stackoverflow.com/questions/2968548/vim-return-to-command-mode-when-focus-is-lost
" set 'updatetime' to 15 seconds when in insert mode (for command below) - http://vim.wikia.com/wiki/To_switch_back_to_normal_mode_automatically_after_inaction
au InsertEnter * let updaterestore=&updatetime | set updatetime=120000
au InsertLeave * let &updatetime=updaterestore
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert


" ------------------------------------------------------------------------------
" Set Paths Section
" ------------------------------------------------------------------------------
" Set central directory for swp and backup files - http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
silent! call mkdir($HOME . '/.vim/swp', 'p')  "https://www.reddit.com/r/vim/comments/2jpcbo/mkdir_issue/
set directory=~/.vim/swp//
set backupdir=~/.vim/swp//

" Set undo directory
silent! call mkdir($HOME . '/.vim/undodir', 'p')
set undodir=~/.vim/undodir  " Need to make sure this directory exists (http://www.electricmonk.nl/log/2012/07/26/persistent-undo-history-in-vim/)


" ------------------------------------------------------------------------------
" Leader Section (I think you have to mapleader before you can define <Leader> shortcuts - so doing it at the top)
" ------------------------------------------------------------------------------
" use spacebar for leader!!!
let mapleader = "\<Space>"

" <L>c  - turn cursor lines on/off
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" <L>q  - ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" <L>q!  - ever so slightly faster quit command w/! override (this is dangerous, will make this something that requires attention)
" nnoremap <Leader>yq :q!<CR>

" <L>w  - ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" <L>x  - ever so slightly faster x command
nnoremap <Leader>x :x<CR>

" <L>snip  - Edit my coffeescript snippets
nnoremap <leader>snip :e ~/.vim/mySnips/jareds-coffee.snippets<cr>

" <L>ev  - Edit active .vimrc FIXME: this should use $MYVIMRC
nnoremap <leader>ev :e ~/.vimrc<cr>

" <L>vimrc  - Edit my git repo vimrc
nnoremap <leader>vimrc :tabedit ~/projects/vimrc/.vimrc<cr>

" <L>d  - show/hide NerdTree
nnoremap <leader>d :NERDTreeToggle<cr>

" <L>reg  - see contents of all registers
nnoremap <leader>reg :reg<cr>

" <L>r  - select word under cursor and prep for replace - http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor NOTE: <Left> kicks the cursor back to left
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" <L>sbp  - source .vimrc
nnoremap <Leader>sbp :so ~/.vimrc<cr>

" <L>p  - paste the yank register (NOTE: shouldn't this be a visual mapping? It works, but not sure why)
nnoremap <Leader>p "0p

" <L>ls - list out all buffers
nnoremap <Leader>ls :ls<cr>

" <L>f - ctrl+w to jump around splits (or "frames")
nnoremap <Leader>f <C-w>


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
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Plug 'jistr/vim-nerdtree-tabs'  " automatically open NERDTree in every tab (shutting off for now - driving me nuts)
Plug 'Shougo/unite.vim'
"Plugs to add
" Plug 'mileszs/ack.vim'
" Plug 'sjbach/lusty'
" Plug 'wincent/Command-T'

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

" default to working anywhere in a word
map dw daw
map cw ciw

"saner n, N - https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
" TODO: map ; to n for use with find

" MacVim tabs
" set guitablabel=%M%t\ (%F)
nnoremap td  :tabclose<CR>
nnoremap th  :tabnext<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tabprev<CR>
nnoremap tm  :tabm<Space>
nnoremap tn  :tabnew<CR>
nnoremap tt  :tabedit<Space>

nnoremap t1  :tabn 1<CR>
nnoremap t2  :tabn 2<CR>
nnoremap t3  :tabn 3<CR>
nnoremap t4  :tabn 4<CR>
nnoremap t5  :tabn 5<CR>
nnoremap t6  :tabn 6<CR>
nnoremap t7  :tabn 7<CR>
nnoremap t8  :tabn 8<CR>
nnoremap t9  :tabn 9<CR>

"newline on return in normal mode - http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nmap <CR> O<Esc>


" ------------------------------------------------------------------------------
" UltiSnips Section
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"this loads up snippets in ~/.vim/plugged/vim-snippets/UltiSnips/jareds-x.snippets and associates with x files
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnips"]
au FileType coffee UltiSnipsAddFiletypes jareds-coffee
au FileType sh UltiSnipsAddFiletypes jareds-shell


" ------------------------------------------------------------------------------
" Load My Snippets Section (TODO: this could be a whole repo that is pulled in) FIXME: its broken in general right now
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/mySnips/jareds-shell.snippets'))
  silent !curl -fLo ~/.vim/mySnips/jareds-shell.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-shell.snippets
endif

if empty(glob('~/.vim/mySnips/jareds-coffee.snippets'))
  silent !curl -fLo ~/.vim/mySnips/jareds-coffee.snippets --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/jareds-coffee.snippets
endif


" ------------------------------------------------------------------------------
" File Type Specific Section
" ------------------------------------------------------------------------------
au FileType markdown setlocal spell wrap linebreak nolist tw=0 wm=0
au FileType text setlocal spell wrap linebreak nolist tw=0 wm=0


" ------------------------------------------------------------------------------
" Tagbar Section
" ------------------------------------------------------------------------------
" following is necessary to support coffeescript with tagbar per https://github.com/majutsushi/tagbar/wiki#coffeescript
" FIXME: this is not working
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }


" ------------------------------------------------------------------------------
" Load my Color stuff Section (color file and fonts?)
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/colors/molokai_dark.vim'))
  silent !curl -fLo ~/.vim/colors/molokai_dark.vim --create-dirs https://raw.githubusercontent.com/fcevado/molokai_dark/master/colors/molokai_dark.vim`
endif

if empty(glob('~/.vim/colors/monokai.vim'))
  silent !curl -fLo ~/.vim/colors/monokai.vim --create-dirs https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
endif


" ------------------------------------------------------------------------------
" GUI Section
" ------------------------------------------------------------------------------
if has("gui_running")
  set guifont=Source\ Code\ Pro:h14
  set transparency=7      "only applicable to macvim
endif


" ------------------------------------------------------------------------------
" Random Commands Section
" ------------------------------------------------------------------------------
" <L>help - pop helpme.md in a browser
nnoremap <Leader>help :!source $HOME/.bash_profile && popmd $PROJECT_HOME/helpdocs/helpme.md<cr>
"
" <L>reload - copy repo .vimrc to active .vimrc
nnoremap <Leader>reload :!cp ~/projects/vimrc/.vimrc ~/.vimrc


" ------------------------------------------------------------------------------
" Insperation Section
" ------------------------------------------------------------------------------
"https://gist.github.com/aflock/6500273
"https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"http://nvie.com/posts/how-i-boosted-my-vim/
"http://www.guckes.net/vim/setup.html (good explanation of basic options)

" Coffeescript specific instructions
" https://github.com/kchmck/vim-coffee-script#compile-to-javascript
" http://esa-matti.suuronen.org/blog/2011/11/28/how-to-write-coffeescript-efficiently/
" https://srackham.wordpress.com/2011/10/20/compiling-coffeescript-with-vim/



