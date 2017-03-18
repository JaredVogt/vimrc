![Vim or Die](http://ih0.redbubble.net/image.46056765.5518/flat,800x800,075,f-c,0,75,800,331.jpg)

## To do by hand
Everything need to get vim going is embedded in vimrc. Run vim and it will install vim-plug automatically. If this repo is on the same machine, then run `vimrc/linkFiles.sh` to create symlinks between repo files and files in `~/.vim`. In theory, one should never be editing any files in `~/vim`. When you are updating `jareds-coffee.snippets`, you want to be editing the file in the repo (or your changes will only be saved locally).

1. `curl -L https://raw.githubusercontent.com/JaredVogt/vimrc/master/.vimrc >> .vimrc` (`-L` if using vimrc.serious.black url)
2. Run `vim` (or macvim) and it will install plugs and get you rolling

## OSX
To get the latest version of vim - grab brew
* `brew install vim` - installs vim to `/usr/local/bin/vim`
* `brew install macvim` - installs macvim to `/usr/local/bin/mvim` - create alias to use
* Vim is also avilable here `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` - but better to get with brew

## Tips
If you have a copy of the repo, you can symlink files in the repo (like `.vimrc`) to keep them in sync. Setup symlinks with `linkFiles.sh`.

### Random additional setup things
* on ubuntu, have to make sure that vim is set to use python - `sudo apt install vim-nox` and voila, it just works.


