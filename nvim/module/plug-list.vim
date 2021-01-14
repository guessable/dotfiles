
"--------------------------------------------------
" plug-in
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
Plug 'guessable/neovim-colors'

" better coding
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf.vim'
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
Plug 'tpope/vim-surround'

" auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" utils
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'voldikss/vim-floaterm'
Plug 'gcmt/wildfire.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ianva/vim-youdao-translater'
Plug 't9md/vim-choosewin'
Plug 'rhysd/accelerated-jk'
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/vim-slash'
Plug 'lilydjwg/fcitx.vim'
call plug#end()
