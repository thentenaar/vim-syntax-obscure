" ca65 Syntax
"
" Language:   Assembly (ca65)
" Maintainer: Tim Hentenaar <tim.hentenaar@gmail.com>
" URL:        http://hentenaar.com
" Version:    2016-01-21
" Description:
"   Syntax highlighting for ca65.
"

" Add '.' to iskeyword
setlocal iskeyword+=.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Be case insensitive
syn case ignore

" 6502 Opcodes
syn keyword ca65Op adc and asl bcc bcs beq bit bmi bne bpl brk
syn keyword ca65Op bvc bvs clc cld cli clv cmp cpx cpy dec dex
syn keyword ca65Op dey eor inc inx iny jmp jsr lda ldx ldy lsr
syn keyword ca65Op nop ora pha php pla plp rol ror rti rts sbc
syn keyword ca65Op sec sed sei sta stx sty tax tay tsx txa txs
syn keyword ca65Op tya

" 6502X Mode Opcodes
syn keyword ca65Op alr anc arr axs dcp isc las lax rla rra sax
syn keyword ca65Op slo sre

" 65C02 Opcodes
syn keyword ca65Op bbr0 bbr1 bbr2 bbr3 bbr4 bbr5 bbr6 bbr7
syn keyword ca65Op bbs0 bbs1 bbs2 bbs3 bbs4 bbs5 bbs6 bbs7
syn keyword ca65Op rmb0 rmb1 rmb2 rmb3 rmb4 rmb5 rmb6 rmb7
syn keyword ca65Op smb0 smb1 smb2 smb3 smb4 smb5 smb6 smb7
syn keyword ca65Op bra phx phy plx ply stp stz trb wai

" 65816 Opcodes
syn keyword ca65Op brl cop jml jsl mvn mvp pea pei per phb
syn keyword ca65Op phd phk plb pld rep rtl sep tcd tcs tdc
syn keyword ca65Op tsb tsc txy tyx xba xce bge blt cpa dea
syn keyword ca65Op ina swa tad tas tda tsa

" Sweet16 Opcodes
syn keyword ca65Op set ld st ldd std pop stp add sub popd cpr
syn keyword ca65Op inr dcr rtn bb bnc bc bp bm bz bnz bm1 bnm1
syn keyword ca65Op bk rs bs

" Registers
syn keyword ca65Reg pc a x y sr sp

" 65816 Registers
syn keyword ca65Reg b s dp db pb

" Operators, numbers, etc.
syn match   ca65Operator   /[+\-\*\/<>%\^~&!\|\^]/
syn match   ca65Operator   />=/
syn match   ca65Operator   /<=/
syn match   ca65Number     /%[01]\+/
syn match   ca65Number     /\d\d\*/
syn match   ca65Number     /\$\x\+/
syn match   ca65Delim      /\#/
syn match   ca65Function   /[^\%x40\.][a-z_][a-z0-9_]\+\:/he=e-1
syn keyword ca65Include    .include .incbin
syn keyword ca65Type       .byte .word .asciiz .dbyt .dword .faraddr
syn keyword ca65Type       .bankbytes .hibytes .lobytes .res .tag
syn keyword ca65PreProc    .a8 .a16 .i8 .i16 .align .assert .bss .case
syn keyword ca65PreProc    .charmap .code .condes .constructor .data
syn keyword ca65PreProc    .def[ine] .defined .destructor .ifblank
syn keyword ca65PreProc    .ifnblank .ifconst .ifref .ifnref .ifdef .ifndef
syn keyword ca65PreProc    .ifpsc02 .ifpc02 .ifp02 .ifp816 .if .elseif
syn keyword ca65PreProc    .else .endif .enum .endenum .proc .endproc .scope
syn keyword ca65PreProc    .endscope .struct .endstruct .end .error
syn keyword ca65PreProc    .endrep[eat] .export[zp] .import[zp] .global[zp]
syn keyword ca65PreProc    .feature .fopt .fileopt .forceimport .org .out
syn keyword ca65PreProc    .interruptor .localchar .psc02 .pc02 .p02 .p816
syn keyword ca65PreProc    .pagelen[gth] .popseg .pushseg .reloc .repeat
syn keyword ca65PreProc    .rodata .segment .setcpu .sunplus .warning
syn keyword ca65PreProc    .zeropage .blank .concat .const .hibyte .lobyte
syn keyword ca65PreProc    .bankbyte .hiword .loword .ident .left
syn keyword ca65PreProc    .mid .right .match .xmatch .referenced .ref
syn keyword ca65PreProc    .sizeof .sprintf .string .strlen ,tcount .cpu
syn keyword ca65PreProc    .time .version .end
syn keyword ca65Statement  .autoimport .debuginfo .linecont .list[bytes]
syn keyword ca65Statement  .smart
syn keyword ca65Macro      .macpack .mac[ro] .local .endmac[ro]
syn keyword ca65Macro      .exitmac[ro] .paramcount
syn region  ca65String     start=/"/ skip=/\\"/ end=/"/
syn region  ca65Comment    start=/;/ end=/$/
syn region  ca65Comment    start="/\*"  end="\*/$"
syn match   ca65Label      /[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1
syn match   ca65LocalLabel /\.[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1
syn match   ca65LocalLabel /\%x40[a-zA-Z_][a-zA-Z0-9_]\+\:/he=e-1

hi link ca65Op         Keyword
hi link ca65Reg        Identifier
hi link ca65Operator   Operator
hi link ca65Delim      Delimiter
hi link ca65Number     Number
hi link ca65Label      Function
hi link ca65Include    Include
hi link ca65Type       Type
hi link ca65PreProc    PreProc
hi link ca65String     String
hi link ca65Comment    Comment
hi link ca65Statement  Statement
hi link ca65Macro      Macro
hi link ca65LocalLabel Special

let b:current_syntax = 'ca65'

