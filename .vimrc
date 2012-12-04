filetype off " 必須的

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 讓Vundle 管理Vundle
Bundle 'gmarik/vundle'

" 代碼源在github 上的
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'msanders/snipmate.vim'

" 代碼存放在vim script 上
" Bundle 'FuzzyFinder'

" 代碼存放在其他地方
" Bundle 'git://git.wincent.com/command-t.git'
" ...

" 設定 vim 編輯預設備份目錄, 必須先 mkdir ~/vi_backup/
"set backupdir=~/vi_backup/
"set backup

"去掉討厭的有關vi一致性模式
set nocompatible

" 游標移動後, 一樣可以用 backsapce, del 等刪除動作
set bs=2

":highlight 可以看到所有的顏色
" save .vimrc, auto exec, .vimrc 如果存檔, 就會立刻實現
"autocmd! bufwritepost .vimrc source %

syntax on
    
" /usr/share/vim/vim63/colors/desert.vim
highlight Search term=reverse ctermbg=4 ctermfg=7
"highlight Normal ctermbg=black ctermfg=white
highlight Folded ctermbg=black ctermfg=darkcyan
"hi Comment ctermbg=black ctermfg=darkcyan

" 下面出現一列 bar.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" 搜尋到的字加 hilight
set hlsearch

filetype on
set number
set cindent
set autoindent
set smartindent

" \t 會以 4個空格代替
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" :sp 開檔時, 上面會列出所有檔案
set wildmenu

" 可以用 {{{ }}} 縮排 Folded
set foldmethod=marker

set tags=tags "設置tags選項為當前目錄下的tags文件 
" {{{ UTF-8 Big5 Setting
" 以下四個設下去. vim 編出來都是 utf-8 編碼的.
set fileencodings=big5,utf-8
" 檔案存檔會存成utf-8編碼
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
" }}}

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" 用vimgrep做到搜尋現在游標下面的字所有出現點
nnoremap <F3> viwy:vimgrep /\<<C-R>"\>/g **/*.[ch] **/*[ch]pp<CR> :cw <CR>
" close all windows
nnoremap <F4> :q<CR> :q<CR> :q<CR> :q<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>

nnoremap <F9> :set paste!<CR>

" 會自動到最後離開的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" 頂部的MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplForceSyntaxEnable = 1

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

" TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" 代碼全能補全
filetype plugin indent on

" 兩個記號，用來識別這項動作做過沒
let g:WM_Started = 0

" 設置ctags
function! Set_ctags()
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1
    let OmniCpp_MayCompleteDot = 1
    let OmniCpp_MayCompleteArrow = 1
    let OmniCpp_MayCompleteScope = 1
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest
endfunction


" 啟動左邊欄
function! Start_WM()
  if g:WM_Started
    return
  endif
  let exname = fnamemodify(bufname("%"), ":e")
  if index(["c", "cpp", "cc", "cxx", "py", "asm", "pas"], exname) != -1
    exec "WMToggle"
    let g:WM_Started = 1
  endif
endfunction

" 自動命令組，用於設置ctags和WM
augroup SettingCtags
  autocmd!
  autocmd BufRead * call Set_ctags()
"  autocmd BufRead * call Start_WM()
augroup END

" =============================
" plugin PowerLine
" =============================
let g:Powerline_symbols = 'fancy'
set guifont=MyFont\ for\ Powerline

" =============================
" plugin NERDtree
" =============================
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
" open directory of current opened file
map <leader>r :NERDTreeFind<cr>

" make nerdtree look nice
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30

" =============================
" plugin ctrlp
" =============================
nnoremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" Single VCS, listing command does not list untracked files:
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" =============================
" plugin ctrlp
" =============================


