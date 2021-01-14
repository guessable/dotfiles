"======================================================
"                     NEOVIM                          |
"        __  ____   ___   ___     _____ __  __        |
"       |  \/  \ \ / / \ | \ \   / /_ _|  \/  |       |
"       | |\/| |\ V /|  \| |\ \ / / | || |\/| |       |
"       | |  | | | | | |\  | \ V /  | || |  | |       |
"       |_|  |_| |_| |_| \_|  \_/  |___|_|  |_|       |
"------------------------------------------------------
" Author:            |    CT                          |
" Description:       |    C++ Python R LaTeX Markdown |
" Last  Modified:    |    Jan. 13 2021                |
"======================================================

" >>> leader key >>>
let mapleader = "\<space>"
let maplocalleader = "\<space>"
" <<< leader key <<<

" >>> neovim behavior >>>
set autochdir
set wrap
set noswapfile
set nofoldenable
set autoread
set showmatch
set showcmd
set number
set relativenumber
set nobackup
set nowritebackup
set termguicolors
set lazyredraw
set ruler
set splitright
set splitbelow
set autoindent
set cindent
set visualbell
set hidden
set autoread
set smarttab
set confirm
set ignorecase

set backspace=2
set clipboard=unnamed
set cinoptions=g0,:0,N-s,(0
set scrolloff=7
set syntax=on
set tabstop=4
set matchtime=1
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set shortmess+=c
set laststatus=2
set showtabline=2
set helplang=cn
set completeopt=noinsert,menuone,noselect
set background=dark

filetype indent on
filetype plugin on
filetype plugin indent on
syntax enable

set nocompatible
set ttyfast

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" python
let python_highlight_all=1
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype python setlocal textwidth=79
autocmd Filetype python setlocal expandtab
autocmd Filetype python setlocal autoindent
autocmd Filetype python setlocal foldmethod=indent
autocmd Filetype python setlocal foldlevel=99
autocmd FileType python,r setlocal cc=79


" c++
autocmd Filetype c,cpp,h,hpp setlocal tabstop=3
autocmd Filetype c,cpp,h,hpp setlocal autoindent
autocmd Filetype c,cpp,h,hpp setlocal cindent
autocmd Filetype c,cpp,h,hpp setlocal shiftwidth=3
autocmd Filetype c,cpp,h,hpp setlocal foldmethod=manual
autocmd FileType c,cpp,h,hpp setlocal cc=79

" last place
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
" <<< neovim behavior <<<

" >>> vim-keymap >>>
nnoremap ; :
nnoremap <silent> <leader>fv :e $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>l1 :silent exec
			\ '!zathura $HOME/.config/nvim/tex/symbols.pdf &'<CR>
nnoremap <silent> <leader>ip :tabnew<CR>:term ipython<CR> i
vnoremap <C-c> "+y

" save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" term
noremap <leader>tv :vnew term://zsh<CR> i
noremap <leader>th :new term://zsh<CR>:res -7<CR> i
tnoremap <C-\> <C-\><C-N>
tnoremap <silent> :q <C-\><C-N>:bd!<CR>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" cursor
nnoremap J 7j
nnoremap K 7k
vnoremap J 7j
vnoremap K 7k

nnoremap <c-a> 0
nnoremap <C-e> $

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <c-o> <Esc>o

inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>

"windows
noremap <c-o> <c-w>o
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

nnoremap <Up> :resize +3<CR>
nnoremap <Down> :resize -3<CR>
" :vertical res +3<CR>

" disable key
inoremap <Up> <Nop>
inoremap <Down> <Nop>

"tab page
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

" buffer
nnoremap <silent> <Left> :bp<CR>
nnoremap <silent> <Right> :bn<CR>
nnoremap <silent> <leader>bd :bd<CR>
inoremap <silent> <Left> <esc>:bp<CR>a
inoremap <silent> <Right> <esc>:bn<CR>a
" >>> vim-keymap <<<

" >>> vim-func >>>
"CodeRun
func! CodeRun()
	if &filetype == 'cpp'
		exec "w"
		set splitbelow
		exec "!g++ -std=c++14 % -Wall -o %:r"
		:sp
		:res -7
		:term ./%:r
	elseif &filetype == 'python'
		exec "w"
		set splitbelow
		:sp
		:res -7
		:term python3 %
	elseif &filetype == 'R'
		exec "w"
		set splitbelow
		:sp
		:res -7
		:term R CMD BATCH %
	elseif &filetype == 'tex'
		exec "w"
		:sp
		:res -12
		:term xelatex %
	elseif &filetype == 'sh'
		exec "w"
		:sp
		:res -12
		:term sh ./%
	elseif &filetype == 'markdown'
		exec "w"
		:MarkdownPreview
	else
		echom "filetype error"
	endif
endfunc
noremap <silent> <leader>r :call CodeRun()<CR>

"debug
func! Debug()
	exec "w"
	if &filetype == 'python'
		set splitbelow
		:sp
		:res -7
		:term python3 -m pdb %
	elseif &filetype == 'cpp'
		set splitbelow
		:sp
		:res -7
		:term gdb %:r
	else
		echom "filetype error"
	endif
endfunc
nnoremap <silent> <leader>db :call Debug()<CR> i

"Bibtex
func! Bibtex()
	if &filetype == 'tex'
		exec "w"
		:sp
		:res -12
		:term cp $HOME/.config/nvim/tex/bibtex.sh ./ &&
					\ sh ./bibtex.sh % %:r.aux && rm bibtex.sh
	else
		echom "filetype error,should be .tex"
	endif
endfunc
nnoremap <silent> <leader>bi :call Bibtex()<CR>
" <<< vim-func <<<

" >>> plug-in >>>
runtime! module/plug-list.vim
runtime! module/plug-ui.vim
runtime! module/plug-config.vim
" <<< plug-in <<<
