myvim2
======

my vimrc and plugin submodule by vundle
=====

my vimrc and plugin


Installation:

    git clone https://github.com/ted-juan/myvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update


Add plugin powerline font, please follow:    
    bundle/powerline/fontpatcher/README.rst


==============================================================
                    plugin CTRLP
==============================================================

enter: 可以在目前 window 中打開(如果已存在其他 tab 中會跳過去)
C-t: 會開新的 tab
C-v: 把目前的 window 做垂直切割開啟

