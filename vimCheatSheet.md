# All Cheats

* `shift+>`|`==`    - indent
* `=`               - indent in visual
* `shift+<`         - outdent 
* `tabe`            - open a file in a new tab
* `ctrl+l`          - cancel contents of search
* `<Leader>reg`     - to see all registers (registers all start with `"` )
* `U`               - return line to original state
* `ctrl+r "`        - paste while in insert mode 
* `ctrl+n`          - try to autocomplete from match in file
* `%`               - jump to matching bracket
* `I`               - go to beginning of the line in append mode
* `''`              - go back to where cursor was last
* `C`               - change to the end of the line
* `D`               - delete to the end of the line
* `}` and `{`       - backwards/fowards by paragraphs (hops whitespaces)
* `)` and `(`       - backwards/fowards by sentances (hops whitespaces)
* `gv`              - reselect last selection
* `<L><L>w`         - open easymotion
* `ci"`             - replace inside `"` (this can also be `{/}/[/]` etc)
* `*, cw, n, .`     - put word under cursor in register, change it, use `n` to jump to next instance and `.` if you want to repeat the change
* `ctrl-r`,`0`      - paste in "insert" mode (from register 0)
* `gt`              - to switch between tabs
* `ctrl+o`          - to jump to previous location
* `:set ft=x`       - set file type
* `:recover`        - look at swp files (this doesn't seem to grab them all tho)
* `f`|`F`           - search forwards/search backwards
* `cgn`             - `/search_something`, then `cgn` to replace... then `.` to apply elsewhere (cool part is that it changes substrings) `gn` is a motion meaning "select the next search match" - so cgn is replace the next search match
* `q:`              - cmdwin mode - can see all previous commands and use normal/insert mode. When ready to execute, `ctrl-c` on the line you want to execute (normal behavior is `<cr>` but I have that mapped to insert new line)
* `ctrl+v`          - visual: visual block mode... alternative to multiple cursors
* `ctrl_v, A, esc`  - visual: visual block, plus append, esc to apply all
* `-`               - netrw: up a directory
* `mb`              - netrw: bookmark directory
* `gb`              - netrw: goto bookmarked directory
* `p`               - netrw: preview
* `<c-h>`	    - netrw: edit file hiding list
* `gn`              - netrw: make top of tree the directory below the cursor (tree mode)
* `~`               - netrw: got to home directory
* `cs"'`            - vim-surround: replace `"` with `'`
* `S"`              - vim-surround: surround visual selection with `"`
* `S)`              - vim-surround: surround visual selection with `()`, no space `S(` for space
* `ysiw]`           - vim-surround: put brackets around a word (iw is a text object)

### Additional options
* `:help macvim-user-defaults`    - see macvim default settings
