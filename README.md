![Vim or Die](http://ih0.redbubble.net/image.46056765.5518/flat,800x800,075,f-c,0,75,800,331.jpg)
FIXME: This needs to be updated (11/5/21)

## Do this
1. `git clone git@github.com:JaredVogt/vimrc.git` to `~/projects`
2. `~/projects/vimrc/linkFiles.sh` 
3. `~/projects/vimrc/installPlugins.sh` 

## To do by hand
#### Download colorschemes

```
mkdir -p ~/.vim/colors && cd $_
git clone git://github.com/altercation/solarized.git
git clone https://github.com/srcery-colors/srcery-vim
```

#### Download plugins (they now go in special directory - no need for a plugin manager [1](https://www.twilio.com/blog/5-must-have-vim-plugins-that-will-change-your-workflow) [2](https://medium.com/@paulodiovani/installing-vim-8-plugins-with-the-native-pack-system-39b71c351fea))

```
mkdir -p ~/.vim/pack/jared/start && cd $_
git clone https://github.com/jiangmiao/auto-pairs
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/haya14busa/incsearch.vim
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/junegunn/vim-easy-align
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/Xuyuanp/nerdtree-git-plugin
```
 
## Updating
In theory, one should never be editing any files in `~/.vim` directly. When you are updating `jareds-coffee.snippets`, you want to be editing the file in the repo (or your changes will only be saved locally).

## Grabbing .vimrc directly from github
1. `curl -L https://raw.githubusercontent.com/JaredVogt/vimrc/master/.vimrc >> .vimrc` (`-L` if using vimrc.serious.black url)
2. Run `vim` (or macvim) and it will install plugs and get you rolling FIXME: this doesn't work now that there isn't a plugin manager in .vimrc

## OSX
To get the latest version of vim - grab brew
* `brew install vim`
* `brew install macvim`

## Tips
If you have a copy of the repo, you can symlink files in the repo (like `.vimrc`) to keep them in sync. Setup symlinks with `linkFiles.sh`.


