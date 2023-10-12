if exists("b:current_syntax")
	finish
endif

syn case ignore

syn keyword z80Reg a b c d e f h l i r af hl bc de ix iy ixh ixl iyh iyl sp
syn keyword z80Flag z nz c nc po pe p m

syn keyword z80Instr adc add and
syn keyword z80Instr bit
syn keyword z80Instr call ccf cp cpd cpdr cpi cpir cpl
syn keyword z80Instr daa dec di djnz
syn keyword z80Instr ex exx ei
syn keyword z80Instr halt
syn keyword z80Instr im in inc ind indr ini inir
syn keyword z80Instr jp jr
syn keyword z80Instr ld ldd lddr ldi ldir
syn keyword z80Instr neg nop
syn keyword z80Instr or otdr otir out outd outi
syn keyword z80Instr res ret reti retn rst rl rla rlc rlca rld rr rra rrc rrca rrd
syn keyword z80Instr sbc scf set sla sll sra srl sub
syn keyword z80Instr pop push
syn keyword z80Instr xor

syn keyword z80Library bcall bjump

syn match z80Directive /\v^\s*\zs\.[a-z0-9_.$]+\ze/

syn match z80Label /\v^[a-z_][a-z0-9_.]*/
syn match z80Label /\v^\s*\zs[a-z_][a-z0-9_.]*\ze:/

syn match z80DecNumber /\v[0-9]+/
syn match z80BinNumber /\v0[bB][01]+/
syn match z80BinNumber /\v\%[01]+/
syn match z80OctNumber /\v0[oO][0-7]+/
syn match z80OctNumber /\v\&[0-7]+/
syn match z80HexNumber /\v0[xX][0-9a-fA-F]+/
syn match z80HexNumber /\v\$[0-9a-fA-F]+/

syn match z80String /\v\".{-}\"/
syn match z80Char /\v\'.{-}\'/

syn keyword z80Todo contained todo
syn match z80Comment /\v\;.*/ contains=z80Todo

syn case match

hi def link z80Reg Include
hi def link z80Flag Include

hi def link z80Instr Type
hi def link z80Library Special
hi def link z80Directive Keyword

hi def link z80Label Keyword

hi def link z80HexNumber Number
hi def link z80OctNumber Number
hi def link z80BinNumber Number
hi def link z80DecNumber Number

hi def link z80String String
hi def link z80Char String

hi def link z80Todo Todo
hi def link z80Comment Comment

let b:current_syntax = "z80"
