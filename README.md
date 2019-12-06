---
tags: vim
---

[TOC]


vim for C/C++ developer
====

## my vimrc and plugin


### Installation:

	git clone https://github.com/ted-juan/myvim2.git ~/.vim

### Create symlinks:

	ln -s ~/.vim/.vimrc ~/.vimrc

### Get Vundle plugin

	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

### Use Bundle Install plugin
	    
	vim ~/.vimrc
	:BundleInstall!

### plugin powerline font:

	bundle/powerline/fontpatcher/README.rst


### Function Key:

F2 : hide/show line number
F3 : 在字串上面上面按F3, 會自動搜索此目錄下所有 *.c/*.cpp/*.h files 相同的 string
F4 : 消掉整個檔案的 ^M
F5 : 左列列出當前目錄的的檔案和子目錄
F6 : 右列列出變數定義和 function name
F7 : C lang 自動補全, (目前關閉)
F8 : 自動分成左右兩個視窗 , 與 comamnd :vsp 相同, 可能需搭配 zsh
F9 : 用滑鼠 copy/phase 時要先執行此 F9, 避免跑其他 plugin, 以及自動空行

### 分割視窗切換鍵:

ctrl + 方向鍵

### 視窗檔案切換鍵:

Shift + 方向鍵

### 常用快捷鍵:

- qq : 不存檔快速離開  
- ctrl+p : 輸入字串快速將match 檔案開啟  
- :vsp : 分割左右視窗  
- :sp : 分割上下視窗  
- ctrl+c : 多檔案時,快速關閉檔案  
- :n [filename]  : 開啟新檔案  
- 將新字串取代舊字串 : 在新字串上輸入 ye, 再舊字串上輸入 vep  

### vim 好用相關 tool

- vimdiff  
- vifm  

### vimdiff 下使用的 copy 鍵

- dp : 目前視窗 copy 到 另一視窗  
- do : 另一視窗 copy 到目前視窗  

### ctags -R

- ctrl+]  : jump into  
- ctrl+o  : back  

### 
