# Using Macvim

* `ctrl+cmd+space` as a global hotkey to access macvim
* `alt+tab` and `alt+shift+tab` to rotate through tabs
* keyboard maestro settings - Jared's Keyboard Shortcuts are not applied in terminal/iterm/macvim and everything is happy - specifically, the two key things are capslock as esc and shift+backspace to go back a word.
* macvim can be run in the shell with `mvim -v` - still trying to figure out why this might be useful.
* `cnoreabbrev <expr> tabnew getcmdtype() == ":" && getcmdline() == "tabnew" ? "tab drop" : "tabnew"` supposedly will direct you to tab if file is already open [more](http://apple.stackexchange.com/questions/53732/macvim-switch-to-tab-where-file-is-opened-if-trying-to-open-an-already-opened)
* `mvim -p file1 file2 file3` to open files in multiple tabs
* test
