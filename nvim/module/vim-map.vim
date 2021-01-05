
"--------------------------------------------------
" key map
"--------------------------------------------------
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
noremap <C-e> $

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
