" TI99/4A Editor/Assembler Syntax
"
" Language:   Assembly (TI99/4A Editor/Assembler)
" Maintainer: Tim Hentenaar <tim.hentenaar@gmail.com>
" URL:        http://hentenaar.com
" Version:    2020-03-24
" Description:
"   Syntax highlighting for the TI99/4A assembler.
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Be case sensitive
syn case match

" Standard Opcodes
syn keyword ti99asmOp SZC SZCB S SB C CB A AB MOV MOVB SOC SOCB
syn keyword ti99asmOp COC CZC XOR XOP LDCR STCR MPY DIV JMP JLT
syn keyword ti99asmOp JLE JEQ JHE JGT JNE JNC JOC JNO JL JH JOP
syn keyword ti99asmOp SBO SBZ TB SRA SRL SLA SRC BLWP B X CLR NEG
syn keyword ti99asmOp INV INC INCT DEC DECT BL SWPB SETO ABS LI
syn keyword ti99asmOp AI ANDI ORI CI STWP STST LWPI LIMI IDLE RSET
syn keyword ti99asmOp RTWP CKON CKOF LREX

" Pseudo Ops
syn keyword ti99asmOp NOP RT

" Workspace Registers
syn keyword ti99asmReg R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 R13
syn keyword ti99asmReg R14 R15

" Operators, numbers, etc.
syn match   ti99asmOperator   /[+\-\*\/]/
syn match   ti99asmNumber     />\x\{1,4\}/
syn match   ti99asmNumber     /\d\d*/
syn match   ti99asmLabel      /^[A-Z][A-Z0-9]\{0,5\}/
syn keyword ti99asmInclude    COPY
syn keyword ti99asmType       DATA BYTE TEXT EVEN
syn keyword ti99asmPreProc    DEF REF EQU BSS BES DXOP
syn keyword ti99asmPreProc    START END AORG RORG DORG
syn keyword ti99asmLoader     PSEG PEND CSEG CEND DSEG DEND LOAD SREF
syn keyword ti99asmOther      UNL LIST PAGE TITL IDT

syn region  ti99asmString     start=/'/ end=/'/
syn region  ti99asmComment    start=/^\*/ end=/$/
syn region  ti99asmComment    start=/\v(^(\s+\S+){2}\s+)@<=\S/ end=/$/
syn region  ti99asmComment    start=/\v(^(\S+\s+){3})@<=\S/ end=/$/
syn region  ti99asmComment    start=/\v(\s*(CKOF|CKON|LREX|IDLE|RSET)\s+)@<=\S+/ end=/$/
syn region  ti99asmComment    start=/\v(\s*(EVEN|NOP|RT|RTWP)\s+)@<=\S+/ end=/$/
syn region  ti99asmOverLen    start=/\%>80v./ end=/$/

hi link ti99asmOp         Keyword
hi link ti99asmReg        Identifier
hi link ti99asmOperator   Operator
hi link ti99asmNumber     Number
hi link ti99asmLabel      Function
hi link ti99asmInclude    Include
hi link ti99asmType       Type
hi link ti99asmPreProc    PreProc
hi link ti99asmLoader     Macro
hi link ti99asmOther      Special
hi link ti99asmString     String
hi link ti99asmComment    Comment
hi link ti99asmOverLen    Error

let b:current_syntax = 'ti99asm'

