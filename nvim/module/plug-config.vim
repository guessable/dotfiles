
"--------------------------------------------------
" choosewin
"--------------------------------------------------
nmap  -  <Plug>(choosewin)

"--------------------------------------------------
" scroll smooth
"--------------------------------------------------
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"--------------------------------------------------
" accelerated jk
"--------------------------------------------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"--------------------------------------------------
" tag
"--------------------------------------------------
nnoremap <silent> <leader>tg :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_ctags_cmd = {
         \ 'haskell': 'hasktags -x -o - -c',
         \ }
let g:vista#renderer#enable_icon = 1

"--------------------------------------------------
" undotree
"--------------------------------------------------
nnoremap <silent> <leader>ud :UndotreeToggle<CR>
set undodir=~/.undodir/
set undofile
let g:undotree_WindowLayout = 3

"--------------------------------------------------
" translater
"--------------------------------------------------
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

"--------------------------------------------------
" markdown preview && tab-mode
"--------------------------------------------------
let g:mkdp_preview_options = {
         \ 'mkit': {},
         \ 'katex': {},
         \ 'uml': {},
         \ 'maid': {},
         \ 'disable_sync_scroll': 0,
         \ 'sync_scroll_type': 'middle',
         \ 'hide_yaml_meta': 1,
         \ 'sequence_diagrams': {},
         \ 'flowchart_diagrams': {}
         \ }
let g:mkdp_page_title = '「${name}」'

nnoremap <leader>tm :TableModeToggle<CR>

"--------------------------------------------------
" LeaderF
"--------------------------------------------------
let g:Lf_CommandMap = {'<C-K>': ['<C-P>'], '<C-J>': ['<C-N>']}
let g:Lf_ShowHidden = 1
let g:Lf_WindowPosition = 'bottom' "popup
let g:Lf_WindowHeight = 0.18
let g:Lf_StlSeparator = { 'left': "\ue0b0",
         \ 'right': "\ue0b2"}
nnoremap <silent> <leader>ff :LeaderfFile<CR>
nnoremap <silent> <leader>fh :LeaderfMru<CR>
nnoremap <silent> <leader>fb :LeaderfBuffer<CR>
nnoremap <silent> <leader>fc :LeaderfColorscheme<CR>
nnoremap <silent> <leader>fw :Leaderf rg<CR>
nnoremap <silent> <leader>lf :<C-U>LeaderfFile ~/<CR>

"--------------------------------------------------
" nerdocmmenter
"--------------------------------------------------
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDToggleCheckAllLines = 1
let g:NERDTrimTrailingWhitespace = 1

"--------------------------------------------------
" wildfire
"--------------------------------------------------
let g:wildfire_objects = ["i'", 'i"', "i)", "i]",
         \ "i}","i>", "ip", "it","iw"]
map , <Plug>(wildfire-fuel)

"--------------------------------------------------
" easymotion
"--------------------------------------------------
let g:EasyMotion_do_mapping = 0
nmap <leader>s <Plug>(easymotion-overwin-f2)
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

"--------------------------------------------------
" visual-multi
"--------------------------------------------------
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'  " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>' " replace visual C-n

"--------------------------------------------------
" format
"--------------------------------------------------
let g:style_ = "astyle --indent=spaces=3 -f -k1 -W1 -j -S -N --pad-oper --style=java "
let g:formatdef_allman = 'g:style_'
let g:formatters_cpp = ['allman']
let g:formatters_h = ['allman']
let g:formatters_c = ['allman']
let g:formatter_yapf_style = 'google'
nnoremap <silent> <leader>fo :Autoformat<CR>
au BufWrite *.cpp,*.h,*.hpp,*.py :Autoformat

"--------------------------------------------------
" bookmark
"--------------------------------------------------
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
nnoremap <silent> <leader>mm :BookmarkToggle<CR>
nnoremap <silent> <leader>mn :BookmarkNext<CR>
nnoremap <silent> <leader>mp :BookmarkPrev<CR>
nnoremap <silent> <leader>mc :BookmarkClear<CR>
nnoremap <silent> <leader>ma :BookmarkClearAll<CR>
nnoremap <silent> <leader>ms :BookmarkShow<CR>

"--------------------------------------------------
" ale
"--------------------------------------------------
let g:ale_sign_error = '❯❯'
let g:ale_sign_warning = '◉'
nnoremap <silent> <leader>dc :ALEToggle<CR>

"--------------------------------------------------
" coc
"--------------------------------------------------
let g:coc_global_extensions=[
         \'coc-pyright',
         \'coc-vimlsp',
         \'coc-json',
         \'coc-snippets',
         \'coc-yank',
         \'coc-explorer',
         \'coc-git'
         \]
inoremap <silent><expr> <TAB>
         \ pumvisible() ? "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
   else
      call CocAction('doHover')
   endif
endfunction
nnoremap <silent> D :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gv :vsp<CR> :call CocAction('jumpDefinition')<CR>
nmap <silent> gh :sp<CR> :call CocAction('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-snippets
inoremap <silent><expr> <TAB>
         \ pumvisible() ? coc#_select_confirm() :
         \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ coc#refresh()
function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

"coc yank
nnoremap <silent> <leader>yk  :<C-u>CocList -A --normal yank<cr>

"coc-explorer
nnoremap <silent> <leader>o :CocCommand explorer --toggle<CR>
