"======================================================
"                   NEOVIM                            +
"------------------------------------------------------
" Author:            |    CT                          |
" Description:       |    C++ Python R LaTeX Markdown |
" Last  Modified:    |    December 29 2020            |
"======================================================

"--------------------------------------------------
" leader key
"--------------------------------------------------
let mapleader = "\<space>"
let maplocalleader = "\<space>"

"--------------------------------------------------
" neovim behavior
"--------------------------------------------------
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
autocmd FileType python setlocal cc=79 " 79 character

" c++
autocmd Filetype cpp,h,hpp setlocal tabstop=3
autocmd Filetype cpp,h,hpp setlocal autoindent
autocmd Filetype cpp,h,hpp setlocal cindent
autocmd Filetype cpp,h,hpp setlocal shiftwidth=3
autocmd Filetype cpp,h,hpp setlocal foldmethod=manual
autocmd FileType cpp,h,hpp setlocal cc=79

runtime! module/vim-map.vim
runtime! module/vim-func.vim

"--------------------------------------------------
" plug
"--------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
" UI
Plug 'ryanoasis/vim-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'joshdick/onedark.vim'

" better coding
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree',{'on':'UndotreeToggle'}
Plug 'Chiel92/vim-autoformat'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim',{'for':'markdown'}
Plug 'dhruvasagar/vim-table-mode',{'for':'markdown'}
Plug 'lervag/vimtex', {'for':['tex','bib']}
Plug 'tpope/vim-fugitive'

" auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" utils
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'voldikss/vim-floaterm'
Plug 'ianva/vim-youdao-translater'
Plug 't9md/vim-choosewin'
Plug 'farmergreg/vim-lastplace'
Plug 'rhysd/accelerated-jk'
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/vim-slash'
call plug#end()

runtime! module/plug-ui.vim
runtime! module/plug-config.vim

