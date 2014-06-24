" Nesasm Syntax
"
" Language:   Assembly (nesasm)
" Maintainer: Tim Hentenaar <tim.hentenaar@gmail.com>
" URL:        http://hentenaar.com
" Version:    2014-06-24
" Description:
"   Syntax highlighting for nesasm.
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
syn keyword nesasmOp adc and asl bcc bcs beq bit bmi bne bpl brk
syn keyword nesasmOp bvc bvs clc cld cli clv cmp cpx cpy dec dex
syn keyword nesasmOp dey eor inc inx iny jmp jsr lda ldx ldy lsr
syn keyword nesasmOp nop ora pha php pla plp rol ror rti rts sbc
syn keyword nesasmOp sec sed sei sta stx sty tax tay tsx txa txs
syn keyword nesasmOp tya

" Registers
syn keyword nesasmReg pc a x y z sr sp

" Operators, numbers, etc.
syn match   nesasmOperator   /[+\-\*\/<>%\^~&!\|\^]/
syn match   nesasmOperator   />=/
syn match   nesasmOperator   /<=/
syn match   nesasmNumber     /%[01]\+/
syn match   nesasmNumber     /\d\d\*/
syn match   nesasmNumber     /\$\x\+/
syn match   nesasmDelim      /\#/
syn match   nesasmFunction   /[^\.][a-z_][a-z0-9_]\+\:/he=e-1
syn keyword nesasmInclude    .include .incbin .incchr .incspr
syn keyword nesasmInclude    .inctitle .incmap
syn keyword nesasmType       .db .dw .ds
syn keyword nesasmPreProc    .equ .list .nolist .mlist .nomlist .page
syn keyword nesasmPreProc    .rs .rsset .fail .zp .bss .code .data
syn keyword nesasmPreProc    .bank .opt .inesprg .ineschr .inesmir
syn keyword nesasmPreProc    .inesmap .ifdef .include .if .else .endif
syn keyword nesasmPreProc    .org .vram
syn keyword nesasmStatement  .func .proc .endp .procgroup .endprocgroup
syn keyword nesasmMacro      .mac[ro] .endm call
syn region  nesasmString     start=/"/ skip=/\\"/ end=/"/
syn region  nesasmComment    start=/;/ end=/$/
syn match   nesasmLabel      /[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1
syn match   nesasmLocalLabel /\.[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1

hi link nesasmOp         Keyword
hi link nesasmReg        Identifier
hi link nesasmOperator   Operator
hi link nesasmDelim      Delimiter
hi link nesasmNumber     Number
hi link nesasmLabel      Function
hi link nesasmInclude    Include
hi link nesasmType       Type
hi link nesasmPreProc    PreProc
hi link nesasmString     String
hi link nesasmComment    Comment
hi link nesasmStatement  Statement
hi link nesasmMacro      Macro
hi link nesasmLocalLabel Special

let b:current_syntax = 'nesasm'

