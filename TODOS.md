- $500 to have the emergency medical from anywhere - they will send a learjet and take you somewhere
- how to save buffers when shutting vim
- perhaps remap autocomplete on snippets to something other than `ctrl+tab`
- what are popups? So an example is what ultisnips uses when you pull up the autocomplete menu - so you can use this for all kinds of fun stuff. There is a plug in that lets you have  your registers show up in a list
- could use the search thing in textexpander - so I have it at least on osx - could probably autogenerate the shortcuts by searching through my snippets
- create shortcut to show all of the leader/vim shortcuts


Ok - some things I have try out after reading vim books
- auto complete with ctrl+p
- creating a tag file
- remove trailing white space automatically - `:%s/\s*$//` - that should remove all trailing white spaces - create an autocommand for this to trigger on file save
- :helpgrep search - very cool, but there has to be a way to make skipping to the next match easier than type :cnext
- gvimdiff from the shell - VERY useful - have to learn how to use it though - it is described in Wicked Cool Vim book
- searching through multiple files with vimgrep
- `:e *file*` or `:reg *file*` to open files for editing - there are some tricks to learn here tho - Wicked Cool Vim book
- :CoffeeCompile let's you checkout the javascript out from a selected chunk of coffeescript
- get that plugin that pops up contents of registers as a popup
- trying out vim-NERDtree-tabs - but it is behaving wonky - will need to follow upk
- what about using cmd+v to paste - just tried it... 
- ctag support for coffeescript - have to add a config file with the CS regex definitions - can be done with .ctags in root of directory or perhaps ctags.conf per https://github.com/winstonwolff/ctags-javascript-coffeescript?
- conditional mode for transparency - only apply if guivim - how to do
- the autoloading NERDTree plugin IS messing up names... maybe take it out for now
- have to use `\` to escape a `|` in a shell command (see <L>cheat)



CTAGS
- I used the regex from this project, https://github.com/winstonwolff/ctags-javascript-coffeescript/blob/master/ctags.conf
- I put the contents of https://raw.githubusercontent.com/winstonwolff/ctags-javascript-coffeescript/master/ctags.conf in .ctags (maybe ctags recognizes ctag.conf as well - or perhaps that can be defined globally)
-

Navigating through code/files
- exuberant ctags and vimtags - 
- command-t - searches through all files, using fuzzy search - don't know how it builds that database of files
- command-p
- lusty explorer - buffergrep - live search through all open buffers - focus on string that you have typed in 
- ack-vim - grep replacement optimized more for code
- fuzzyfinder



color coding less
- http://freecode.com/projects/lesspipe
- http://funkworks.blogspot.com/2013/01/syntax-highlighting-in-less-on-osx.html


### Cheatsheet

- command to go back to last place in file??


### vim-airline and fonts
Holy cow this is a tough on to get all setup correctly. There are a handful of plugs that are needed for this
* 'vim-airline/vim-airline'
* 'vim-airline/vim-airline-themes'
* 'ryanoasis/vim-devicons'
* 'ntpeters/vim-airline-colornum'
You also have to grab the nerd fonts. `git clone https://github.com/ryanoasis/nerd-fonts`

### Random stuff

First section will open a file in a split - but the split doesn't have focus - so you can keep typing - what is easy toggle to shut it?
```
let g:MyVimTips="off"
function! ToggleVimTips()
  if g:MyVimTips == "on"
    let g:MyVimTips="off"
    pclose
  else
    let g:MyVimTips="on"
    pedit ~/vimtips.txt
    pedit !more ~/.vimrc | grep '<L>' 
  endif
endfunction

nnoremap <Leader>tips :call ToggleVimTips()<CR>
```

This section is a popup that will allow you to select something and have it pasted in while in insert mode
```
inoremap <Leader>up :call ListMonths()<CR>

func! ListMonths()
  call complete(col('.'), ['January', 'February', 'March',
        \ 'April', 'May', 'June', 'July', 'August', 'September',
        \ 'October', 'November', 'December'])
  return ''
endfunc
```
