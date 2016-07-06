![Vim or Die](http://ih0.redbubble.net/image.46056765.5518/flat,800x800,075,f-c,0,75,800,331.jpg)

## To do by hand
Everything need to get vim going is embedded in vimrc. Run vim and it will install vim-plug automatically

1. `curl -L https://raw.githubusercontent.com/JaredVogt/vimrc/master/.vimrc >> .vimrc` (`-L` if using vimrc.serious.black url)
2. Run `vim` (or macvim) and it will install plugs and get you rolling

## OSX
To get the latest version of vim - grab brew
* `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* `brew install vim` - installs vim to `/usr/local/bin/vim`
* `brew install macvim` - installs macvim to `/usr/local/bin/mvim` - create alias to use

## Tips
If you have a copy of the repo, you can symlink files in the repo (like `.vimrc`) to keep them in sync. Setup symlinks with `linkFiles.sh`.

### Random additional setup things
* on ubuntu, have to make sure that vim is set to use python - `sudo apt install vim-nox` and voila, it just works.


