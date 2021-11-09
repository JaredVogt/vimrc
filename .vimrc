" ------------------------------------------------------------------------------
"
" Basic settings
" ------------------------------------------------------------------------------
set timeout timeoutlen=2000 ttimeoutlen=1000  " a little more time to complete Leader sequences
set history=1000            " remember more commands and search history
set undolevels=1000         " use many muchos levels of undo
set visualbell              " don't beep
set noerrorbells            " don't beep
set nocompatible            " Necessary for lots of cool vim things
set switchbuf=usetab        " If opening buffer, search first in opened windows
set showcmd                 " show what my commands are
set relativenumber          " NOTE: `set nornu` to turn off
set number                  " this shows you the current line number in relative mode
set scrolloff=6             " keep at least 6 lines top/bottom while scrolling
set clipboard=unnamed       " yank to system clipboard
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch                " highlight search terms  NOTE: in sensible
set splitright              " :vsp will open split on the right side
set incsearch               " show search matches as you type  NOTE: in sensible
set ww=<,>,h,l              " wrap lines with movement keys
"set list                    " show characters  FIXME: like to show trailing spaces but NOT newlines
set wildmenu                " autocompletion  NOTE: in sensible
autocmd FocusLost * silent! wa   " Auto save buffers whenever you lose focus
set autowriteall            " Auto save buffers when you switch context
set lcs+=trail:·            " show trailing spaces
set undofile                " Maintain undo history between sessions NOTE: requires path to be set
set wildignore=node_modules/*
set wildignore+=cs2js/*
set wildignore+=*.swp,*.bak,*.pyc,*.class

" if no filetype specified, set ft=markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" Needed for Syntax Highlighting and stuff (NOTE: http://stackoverflow.com/questions/5602767/why-is-vim-not-detecting-my-coffescript-filetype)
" filetype on
filetype plugin on
filetype indent on
syntax enable

" vim-session settings
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" colorscheme solarized
colorscheme solarized
set background=dark
" this is required to get true black background
highlight Normal guibg=black

" tab settings
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab                " insert tabs on the start of a line according to shiftwidth, not tabstop

" setup the cross hairs
hi CursorLine   cterm=NONE ctermbg=black guibg=#330000          " guifg=white  ctermfg=lightblue  overrides the colors on highlighted characters - disconcerting, but distinct
hi CursorColumn cterm=NONE ctermbg=black guibg=#330000
set cursorline cursorcolumn

" but turn off cursor line with in insert
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" automatic switching back to normal mode
" autocmd FocusLost * stopinsert   " switch back to normal on change of focus (FIXME: there is issue here... )
autocmd FocusLost * call feedkeys("\<C-\>\<C-n>")  " this looks like it might solve problem per http://stackoverflow.com/questions/2968548/vim-return-to-command-mode-when-focus-is-lost
" set 'updatetime' to 15 seconds when in insert mode (for command below) - http://vim.wikia.com/wiki/To_switch_back_to_normal_mode_automatically_after_inaction
autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=120000
autocmd InsertLeave * let &updatetime=updaterestore
" automatically leave insert mode after 'updatetime' milliseconds of inaction
autocmd CursorHoldI * stopinsert

" ------------------------------------------------------------------------------
" Set Paths
" ------------------------------------------------------------------------------
" Set central directory for swp and backup files - http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
silent! call mkdir($HOME . '/.vim/swp', 'p')  "https://www.reddit.com/r/vim/comments/2jpcbo/mkdir_issue/
set directory=~/.vim/swp//
set backupdir=~/.vim/swp//

" Set undo directory
silent! call mkdir($HOME . '/.vim/undo', 'p')
set undodir=~/.vim/undo  " Need to make sure this directory exists (http://www.electricmonk.nl/log/2012/07/26/persistent-undo-history-in-vim/)


" Set backup directory
silent! call mkdir($HOME . '/.vim/backup', 'p')
set backupdir=~/.vim/backup  " Need to make sure this directory exists (http://www.electricmonk.nl/log/2012/07/26/persistent-undo-history-in-vim/)


" ------------------------------------------------------------------------------
" Leader (I think you have to mapleader before you can define <Leader> shortcuts - so doing it at the top)
" ------------------------------------------------------------------------------
" use spacebar for leader!!!
let mapleader = "\<Space>"

" <L>c        - turn cursor lines on/off
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" <L>q        - ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

"" <L>q!         - ever so slightly faster quit command w/! override (this is dangerous, will make this something that requires attention)
" nnoremap <Leader>yq :q!<CR>

" <L>w        - ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" <L>x        - ever so slightly faster x command
nnoremap <Leader>x :x<CR>

" <L>snip     - Edit my coffeescript snippets
nnoremap <leader>snip :e ~/.vim/mySnips/jareds-coffee.snippets<cr>

" <L>shell    - Open up snippets in split
nnoremap <leader>shell :vsp ~/.vim/mySnips/more-shell.snippets<cr>

" <L>ev       - Edit active .vimrc FIXME: this should use $MYVIMRC
nnoremap <leader>ev :e ~/.vimrc<cr>

" <L>vimrc    - Edit my git repo vimrc
nnoremap <leader>vimrc :tabedit ~/projects/vimrc/.vimrc<cr>

" <L>d        - show/hide NerdTree (netrw)
" nnoremap <leader>d :Texplore<cr>  "netrw
nnoremap <leader>d :e ~/.config/symlinks<cr>
" nnoremap <leader>d :vs.<cr>

" <L>reg      - see contents of all registers
nnoremap <leader>reg :reg<cr>

" <L>s        - suggest spelling
nnoremap <leader>s z=

"" <L>u        - select word under cursor and prep for replace - http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor NOTE: <Left> kicks the cursor back to left
nnoremap <Leader>u :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" <L>sbp      - source .vimrc
nnoremap <Leader>sbp :so ~/.vimrc<cr>

" <L>p        - paste the yank register (NOTE: shouldn't this be a visual mapping? It works, but not sure why)
nnoremap <Leader>p "0p

" <L>o        - and type tab, will open wildmenu for current directory
nnoremap <Leader>o :tabedit

" <L>l        - visually select everything in last insert mode
" FIXME: how do I use a leader key to map to a mode? Currently, the leader mapping doesn't work
nmap <Leader>l gV
nmap gV `[v`]

" <L>ls       - list out all buffers
nnoremap <Leader>ls :ls<cr>

" <L>f        - ctrl+w to jump around splits (or "frames")
nnoremap <Leader>f <C-w>

" <L>paste    - toggle paste mode to paste without autoindent
nnoremap <Leader>paste :set pastetoggle<cr>

" <L>;        - jump back to last edit `g;`
nnoremap <Leader>; g;

" turn off search highlight
"nnoremap <Leader><space> :noh<cr>
nnoremap <Esc><Esc><Esc> :noh<cr>

" vertical split fuzzy search
nnoremap <leader>v :vsp **/*
"" :vsp **/*"


" ------------------------------------------------------------------------------
" GUI
" ------------------------------------------------------------------------------
if has("gui_running")
  let $MYVIMRC = "~/.vimrc"           " this is not set by macvim - so forcing the issue
  " These are the basic settings to get the font to work (required):
  " set guifont=SauceCodePro\ Nerd\ Font:h14
  set macligatures
  set guifont=Fira\ Code:h17
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  " set guifont=DroidSansMonoforPowerline\ Nerd\ Font:h14  "Chadwick declares this best programming font ever
  set encoding=utf-8
  " required if using https://github.com/bling/vim-airline
  let g:airline_powerline_fonts=1
  let g:airline_theme='simple'  " FIXME: this was set to airlineish, but it screws up colors on easymotion
  set transparency=7      "only applicable to macvim, range 0-100
  set lines=999 columns=124  " set window to largest size
endif

" ------------------------------------------------------------------------------
" Spell - everything related to spelling
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/spell/en.utf-8.add'))
  silent !curl -fLo ~/.vim/spell/en.utf-8.add --create-dirs https://raw.githubusercontent.com/JaredVogt/vimrc/master/spell/en.utf-8.add
endif
set spellfile=~/.vim/spell/en.utf-8.add


" ------------------------------------------------------------------------------
" Source - source vimrc files on save
" ------------------------------------------------------------------------------
augroup myvimrc
    autocmd!
    autocmd BufWritePost .vimrc,.gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    :echo "Sourced rc files"
augroup END

" ------------------------------------------------------------------------------
" General shortcuts
" ------------------------------------------------------------------------------
" for situations where capslock isn't remapped
imap jj <Esc>

" remap vim-commentary, just quicker
nmap cc gcc

" remap vim-commentary to be the same in visual mode, just quicker
vmap cc gc

" Quickly insert an empty new line without entering insert mode
    nnoremap <CR> o<Esc>k

" j/k/0/$ moves even for a wrapped lines (updated with hint for use with relative line numbers - https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)
nmap 0 g0
nmap $ g$
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" default to working anywhere in a word
map dw daw
map cw ciw

" saner n, N - https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
" TODO: map ; to n for use with find

" ------------------------------------------------------------------------------
" Plugin settings 
" ------------------------------------------------------------------------------

" Easymotion
"Disable default mappings
let g:EasyMotion_do_mapping = 0

"Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"keep cursor column when JK motion
let g:EasyMotion_startofline = 0

"Use upper target labels and type as a lower case
"let g:EasyMotion_use_upper = 1

let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwy'
"nmap f <Plug>(easymotion-s2) 
nmap <leader><space> <Plug>(easymotion-w)
nmap f <Plug>(easymotion-bd-f2)

" Nerdtree
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ------------------------------------------------------------------------------
" cmdline - default to command window for cmdline mode
" ------------------------------------------------------------------------------

"  default to opening command window
execute "nnoremap : :" . &cedit . "a"
execute "xnoremap : :" . &cedit . "a"
execute "nnoremap / /" . &cedit . "a"
execute "xnoremap / /" . &cedit . "a"
execute "nnoremap ? ?" . &cedit . "a"
execute "xnoremap ? ?" . &cedit . "a"

" access cmdline by appending with q
nnoremap q: :
xnoremap q: :
nnoremap q/ /
xnoremap q/ /
nnoremap q? ?
xnoremap q? ?

" enable <esc> for command window
autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>

