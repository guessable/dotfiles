
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
			\]
let g:dashboard_custom_footer = ['e^(iπ) + 1 = 0     --by Leonhard Euler']
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
let g:indentLine_fileType = ['python','cpp']

"--------------------------------------------------
" theme&statusline&tabline
"--------------------------------------------------
" colorscheme
let ayucolor="mirage"
let g:dracula_italic=0

colorscheme onedark
" colorscheme doom-one
" colorscheme deus
" colorscheme ayu
" colorscheme dracula
" colorscheme oceanic_material

" statusline
let g:lightline = {}
let g:lightline.colorscheme = 'lightline'
let g:lightline.separator= {'left': '','right': '' }
let g:lightline.subseparator={'left': ' ','right': ' ' }
let g:lightline.active={
			\   'left': [ [ 'mode', 'paste' ],['fugitive'],['readonly']],
			\   'right': [[ 'syntastic', 'lineinfo' ], [ 'percent' ],
			\            [ 'filetype','fileencoding'] ]
			\ }
" tabline
let g:lightline.tabline = {'left': [['logo'],['separator'],['tabs']],
			\ 'right': [['fileformat']]}

" component_function
let g:lightline.component_function={
			\ 'fugitive': 'LightlineFugitive',
			\ 'readonly':'LightlineReadonly',
			\ 'filetype': 'MyFiletype',
			\ 'fileformat': 'MyFileformat',
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
" filetype icons
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' '
				\ . WebDevIconsGetFileTypeSymbol() : ' ') : ''
endfunction
" fileformat
function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' '
				\ . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" logo
function! Logo()
	return ' CT'
endfunction
