vim for C/C++ developer
====

my vimrc and plugin


Installation:

    git clone https://github.com/ted-juan/myvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update


plugin powerline font:    

    bundle/powerline/fontpatcher/README.rst


plugin CTRLP:

enter: �i�H�b�ثe window �����}(�p�G�w�s�b��L tab ���|���L�h)
C-t: �|�}�s�� tab
C-v: ��ثe�� window ���������ζ}��

plugin easyMotion:

    Mapping           | Details
    ------------------|----------------------------------------------
    <Leader>f{char}   | Find {char} to the right. See |f|.
    <Leader>F{char}   | Find {char} to the left. See |F|.
    <Leader>t{char}   | Till before the {char} to the right. See |t|.
    <Leader>T{char}   | Till after the {char} to the left. See |T|.
    <Leader>w         | Beginning of word forward. See |w|.
    <Leader>W         | Beginning of WORD forward. See |W|.
    <Leader>b         | Beginning of word backward. See |b|.
    <Leader>B         | Beginning of WORD backward. See |B|.
    <Leader>e         | End of word forward. See |e|.
    <Leader>E         | End of WORD forward. See |E|.
    <Leader>ge        | End of word backward. See |ge|.
    <Leader>gE        | End of WORD backward. See |gE|.
    <Leader>j         | Line downward. See |j|.
    <Leader>k         | Line upward. See |k|.
    <Leader>n         | Jump to latest "/" or "?" forward. See |n|.
    <Leader>N         | Jump to latest "/" or "?" backward. See |N|.
