My vim setup for MacOS and Linux.

~~~
git clone https://github.com/greendog99/vimrc.git ~/.vim
ln -s --force ~/.vim/vimrc ~/.vimrc
ln -s --force ~/.vim/gvimrc ~/.gvimrc
~~~

The first run of `vim` will install (vim-plug)[https://github.com/junegunn/vim-plug]
and all the specified plugins.

For vim-ack, `ag` from The Silver Searcher will be used if installed, otherwise
`ack` will be used.

On MacOS, install the MesloLG* font and enable it in iTerm2.
~~~
brew cask install font-meslolg-nerd-font
~~~

