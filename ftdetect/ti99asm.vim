
" Look for common ti99 assembler directives / comments in the first
" 8 lines of the file.
func! s:CheckTIAsm()
	let n = 1
	while n <= min([line('$'), 8])
		let lx = getline(n)
		let n += 1

		if lx =~? '^\*\s' || lx =~? '^\v\s+(IDT|DEF|REF)\s' ||
		\  lx =~? '^\v\s+[DRA]ORG\s+\>[0-9A-F]'
			setf ti99asm
			return
		endif
	endwhile
endfunc

augroup filetypedetect
au! BufNewFile,BufRead *.ti99asm setf ti99asm
au! BufNewFile,BufRead *.asm call s:CheckTIAsm()
augroup END
