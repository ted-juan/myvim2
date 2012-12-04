filetype off " ������

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ��Vundle �޲zVundle
Bundle 'gmarik/vundle'

" �N�X���bgithub �W��
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'msanders/snipmate.vim'

" �N�X�s��bvim script �W
" Bundle 'FuzzyFinder'

" �N�X�s��b��L�a��
" Bundle 'git://git.wincent.com/command-t.git'
" ...

" �]�w vim �s��w�]�ƥ��ؿ�, ������ mkdir ~/vi_backup/
"set backupdir=~/vi_backup/
"set backup

"�h���Q��������vi�@�P�ʼҦ�
set nocompatible

" ��в��ʫ�, �@�˥i�H�� backsapce, del ���R���ʧ@
set bs=2

":highlight �i�H�ݨ�Ҧ����C��
" save .vimrc, auto exec, .vimrc �p�G�s��, �N�|�ߨ��{
"autocmd! bufwritepost .vimrc source %

syntax on
    
" /usr/share/vim/vim63/colors/desert.vim
highlight Search term=reverse ctermbg=4 ctermfg=7
"highlight Normal ctermbg=black ctermfg=white
highlight Folded ctermbg=black ctermfg=darkcyan
"hi Comment ctermbg=black ctermfg=darkcyan

" �U���X�{�@�C bar.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" �j�M�쪺�r�[ hilight
set hlsearch

filetype on
set number
set cindent
set autoindent
set smartindent

" \t �|�H 4�ӪŮ�N��
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" :sp �}�ɮ�, �W���|�C�X�Ҧ��ɮ�
set wildmenu

" �i�H�� {{{ }}} �Y�� Folded
set foldmethod=marker

set tags=tags "�]�mtags�ﶵ����e�ؿ��U��tags��� 
" {{{ UTF-8 Big5 Setting
" �H�U�|�ӳ]�U�h. vim �s�X�ӳ��O utf-8 �s�X��.
set fileencodings=big5,utf-8
" �ɮצs�ɷ|�s��utf-8�s�X
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
" }}}

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" ��vimgrep����j�M�{�b��ФU�����r�Ҧ��X�{�I
nnoremap <F3> viwy:vimgrep /\<<C-R>"\>/g **/*.[ch] **/*[ch]pp<CR> :cw <CR>
" close all windows
nnoremap <F4> :q<CR> :q<CR> :q<CR> :q<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>

nnoremap <F9> :set paste!<CR>

" �|�۰ʨ�̫����}����m
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" ������MiniBufExplorer
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

" �N�X����ɥ�
filetype plugin indent on

" ��ӰO���A�Ψ��ѧO�o���ʧ@���L�S
let g:WM_Started = 0

" �]�mctags
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


" �Ұʥ�����
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

" �۰ʩR�O�աA�Ω�]�mctags�MWM
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


