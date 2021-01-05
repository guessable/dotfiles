
"--------------------------------------------------
" dashboard
"--------------------------------------------------
nnoremap <silent> <leader>ds :Dashboard<CR>
let g:dashboard_custom_header = [
			\'                                 _.-~~.)                                     ',
			\'           _.--~~~~~---....__  .` . .,`                                      ',
			\'         ,`. . . . . . . . . .~- ._ (                                        ',
			\'        ( .. .g. . . . . . . . . . .~-._                                     ',
			\'     .~__.-~    ~`. . . . . . . . . . . -.                                   ',
			\'     `----..._      ~-=~~-. . . . . . . . ~-.                                ',
			\'               ~-._   `-._ ~=_~~--. . . . . .~.                              ',
			\'                | .~-.._  ~--._-.    ~-. . . . ~-.                           ',
			\'                 \ .(   ~~--.._~       `. . . . .~-.                 ,       ',
			\'                  `._\         ~~--.._    `. . . . . ~-.    .- .   ,`/       ',
			\'  _  . _ . -~\        _ ..  _          ~~--.`_. . . . . ~-_     ,-`,`  .     ',
			\'               ` ._           ~                ~--. . . . .~=.-,. /. `       ',
			\'         - . -~            -. _ . - ~ - _   - ~     ~--..__~ _,. /   \  - ~  ',
			\'                . __ ..                   ~-               ~~_. (  `         ',
			\'  )`. _ _               `-       ..  - .    . - ~ ~ .    \    ~-` ` `  `. _  ',
			\'',
			\'e^iπ+1=0',
			\]
let g:dashboard_custom_section = {
			\ 'a_find_history'        :{
			\ 'description': ['  Recently opened files                 SPC f h'],
			\ 'command': 'LeaderfMru'},
			\ 'b_find_file'           :{
			\ 'description': ['  Find File                             SPC f f'],
			\ 'command': 'LeaderfFile'},
			\ 'd_find_buffer'         :{
			\ 'description': ['  Recently buffers                      SPC f b'],
			\ 'command': 'LeaderfBuffer'},
			\ 'e_find_word'           :{
			\ 'description': ['  Find word                             SPC f w'],
			\ 'command': 'Leaderf rg'},
			\ 'f_change_colorscheme'  :{
			\ 'description': ['  Change Colorscheme                    SPC f c'],
			\ 'command': 'LeaderfColorscheme'},
			\ 'g_open_personal'       :{
			\ 'description': ['  Open Personal Config File             SPC f v'],
			\ 'command': 'e $HOME/.config/nvim/init.vim'},
			\}

"--------------------------------------------------
" rainbow
"--------------------------------------------------
let g:rainbow_conf = {
			\ 'guifgs': ['DarkYellow', 'darkorange3', 'seagreen3', 'firebrick'],
			\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\ 'operators': '_,_',
			\ 'parentheses': [
			\'start=/(/ end=/)/ fold',
			\'start=/\[/ end=/\]/ fold',
			\'start=/{/ end=/}/ fold'],
			\ 'separately': {
			\     '*': {},
			\     'tex': {
			\         'parentheses': [
			\'start=/(/ end=/)/',
			\'start=/\[/ end=/\]/',
			\'start=/{/ end=/}/'],
			\     },
			\     'vim': {
			\         'parentheses': [
			\'start=/(/ end=/)/',
			\'start=/\[/ end=/\]/',
			\'start=/{/ end=/}/ fold',
			\'start=/(/ end=/)/ containedin=vimFuncBody',
			\'start=/\[/ end=/\]/ containedin=vimFuncBody',
			\'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\     }
			\ }
			\}

"--------------------------------------------------
" indentline&highlightedyank
"--------------------------------------------------
let g:rainbow_active = 1
let g:highlightedyank_highlight_duration = 100
let g:emoji_complete_overwrite_standard_keymaps = 0
let g:indentLine_char_list = ['|', '┊', '┆', '¦' ]
let g:indentLine_fileType = ['python']

"--------------------------------------------------
" theme&statusline&tabline
"--------------------------------------------------
let ayucolor="mirage"
colorscheme onedark
" colorscheme doom-one
" colorscheme deus
" colorscheme ayu

let g:lightline = {}
let g:lightline.colorscheme = 'my_onedark'
let g:lightline.separator= {'left': '','right': '' }
let g:lightline.subseparator={'left': ' ','right': ' ' }
let g:lightline.active={
			\   'left': [ [ 'mode', 'paste' ],['fugitive'],['readonly']],
			\   'right': [[ 'syntastic', 'lineinfo' ], [ 'percent' ],
			\            [ 'filetype','fileencoding' ] ]
			\ }
let g:lightline.component_function={
			\ 'fugitive': 'LightlineFugitive',
			\ 'readonly':'LightlineReadonly',
			\ 'filetype': 'MyFiletype',
			\ 'bufferinfo': 'lightline#buffer#bufferinfo',
			\ 'fileformat': 'MyFileformat',
			\ 'buffer_logo':'Buffer_logo',
			\ 'logo':'Logo'}

" Fugitvie
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction
" readonly
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunctio
" my message
function! Buffer_logo()
	return '𝓑 '
endfunction
function! Logo()
	return ' CT'
endfunction
" filetype icons
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' '
				\ . WebDevIconsGetFileTypeSymbol() : ' ') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' '
				\ . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" tabline
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#icon_position = 'right'
let g:lightline#bufferline#modified = ' ✭'
let g:lightline#bufferline#read_only = ''
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_map = {
			\ 0: '𝟘', 1: '𝟙', 2: '𝟚', 3: '𝟛', 4: '𝟜',
			\ 5: '𝟝', 6: '𝟞', 7: '𝟟', 8: '𝟠', 9: '𝟡' }
let g:lightline.tabline = {'left': [['buffer_logo'],['separator'],['buffers']],
			\ 'right': [['logo']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.tab = {
			\ 'active': [ 'tabnum'],
			\ 'inactive': [ 'tabnum'] }
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>d1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>d2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>d3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>d4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>d5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>d6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>d7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>d8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>d9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>d0 <Plug>lightline#bufferline#delete(10)
