
"--------------------------------------------------
" func
"--------------------------------------------------
"CodeRun
func! CodeRun()
	if &filetype == 'cpp'
		exec "w"
		set splitbelow
		:sp
		:res -7
		:term g++ -std=c++14 % -Wall -o %:r -g
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
