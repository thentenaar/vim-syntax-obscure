" Ophis/p65 Syntax
"
" Language:   Assembly (ophis/p65)
" Maintainer: Tim Hentenaar <tim.hentenaar@gmail.com>
" URL:        http://hentenaar.com
" Version:    2014-06-20
" Description:
"   Syntax highlighting for ophis/p65.
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Add '.' to iskeyword
setlocal iskeyword+=.

" Be case insensitive
syn case ignore

" Standard Opcodes
syn keyword ophisOp adc and asl bcc bcs beq bit bmi bne bpl brk
syn keyword ophisOp bvc bvs clc cld cli clv cmp cpx cpy dec dex
syn keyword ophisOp dey eor inc inx iny jmp jsr lda ldx ldy lsr
syn keyword ophisOp nop ora pha php pla plp rol ror rti rts sbc
syn keyword ophisOp sec sed sei sta stx sty tax tay tsx txa txs
syn keyword ophisOp tya adc.w and.w asl.w bit.w cmp.w cpx.w
syn keyword ophisOp cpy.w dec.w eor.w inc.w lda.w ldx.w ldy.w
syn keyword ophisOp lsr.w ora.w rol.w ror.w sbc.w sta.w stx.w sty.w

" Undocumented Opcodes
syn keyword ophisOp anc ane arr asr dcp isb las lax lxa rla rra
syn keyword ophisOp sax sbx sha shs shx slo sre

" c02 Extensions
syn keyword ophisOp bbr0 bbr1 bbr2 bbr3 bbr4 bbr5 bbr6 bbr7
syn keyword ophisOp bbs0 bbs1 bbs2 bbs3 bbs4 bbs5 bbs6 bbs7
syn keyword ophisOp rmb0 rmb1 rmb2 rmb3 rmb4 rmb5 rmb6 rmb7
syn keyword ophisOp smb0 smb1 smb2 smb3 smb4 smb5 smb6 smb7
syn keyword ophisOp bra dea ina phx phy plx ply stp stz trb
syn keyword ophisOp stz.w trb.w tsb tsb.w wai

" 4502 Extensions
syn keyword ophisOp asw cle cpz dew dez eom inw inz ldz map
syn keyword ophisOp neg phw phz plz row see tab taz tba tsy
syn keyword ophisOp tys tza

" Registers
syn keyword ophisReg pc a x y z sr sp

" Operators, numbers, etc.
syn match   ophisOperator /[\+\-\*\/<>]/
syn match   ophisNumber   /%[01]\+/
syn match   ophisNumber   /\d\d\*/
syn match   ophisNumber   /\$\x\+/
syn match   ophisDelim    /\#/
syn match   ophisLabel    /\.\?[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1
syn keyword ophisInclude  .include .incbin
syn keyword ophisType     .byte[be] .word[be] .dword[be] .cbmfloat
syn keyword ophisPreProc  .alias .org .advance .text .data .bank
syn keyword ophisPreProc  .checkpc .space .scope .scend
syn keyword ophisMacro    .macro .macend .invoke
syn region  ophisString   start=/"/ skip=/\\"/ end=/"/
syn region  ophisComment  start=/;/ end=/$/
syn match   ophisAnonLabel /^\s*\*\s/
syn match   ophisAnonLabel /\s[\+\-]\+$/

hi link ophisOp        Keyword
hi link ophisReg       Identifier
hi link ophisOperator  Operator
hi link ophisDelim     Delimiter
hi link ophisNumber    Number
hi link ophisLabel     Function
hi link ophisInclude   Include
hi link ophisType      Type
hi link ophisPreProc   PreProc
hi link ophisMacro     Macro
hi link ophisString    String
hi link ophisComment   Comment
hi link ophisAnonLabel Special

let b:current_syntax = 'ophis'
