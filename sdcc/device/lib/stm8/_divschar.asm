;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:48 2022
;--------------------------------------------------------
	.module _divschar
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divschar
	.globl __divuschar
	.globl __divsuchar
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../_divschar.c: 31: _divschar (signed char x, signed char y)
;	-----------------------------------------
;	 function _divschar
;	-----------------------------------------
__divschar:
;	../_divschar.c: 33: return ((int)x / (int)y);
	ld	a, (0x03, sp)
	ld	yl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	yh, a
	ld	a, (0x04, sp)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	pushw	x
	pushw	y
	call	__divsint
	addw	sp, #4
	ret
;	../_divschar.c: 37: _divuschar (unsigned char x, unsigned char y)
;	-----------------------------------------
;	 function _divuschar
;	-----------------------------------------
__divuschar:
;	../_divschar.c: 39: return ((int)((signed char)x) / (int)y);
	ld	a, (0x03, sp)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	clrw	y
	ld	a, (0x04, sp)
	ld	yl, a
	pushw	y
	pushw	x
	call	__divsint
	addw	sp, #4
	ret
;	../_divschar.c: 43: _divsuchar (signed char x, signed char y)
;	-----------------------------------------
;	 function _divsuchar
;	-----------------------------------------
__divsuchar:
;	../_divschar.c: 45: return ((int)((unsigned char)x) / (int)y);
	ld	a, (0x03, sp)
	clrw	y
	ld	yl, a
	ld	a, (0x04, sp)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	pushw	x
	pushw	y
	call	__divsint
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
