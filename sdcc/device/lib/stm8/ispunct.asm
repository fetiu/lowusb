;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:53 2022
;--------------------------------------------------------
	.module ispunct
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalnum
	.globl _isspace
	.globl _isprint
	.globl _ispunct
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
;	../ispunct.c: 33: int ispunct (int c)
;	-----------------------------------------
;	 function ispunct
;	-----------------------------------------
_ispunct:
;	../ispunct.c: 35: return (isprint (c) && !isspace (c) && !isalnum (c));
	ldw	x, (0x03, sp)
	pushw	x
	call	_isprint
	addw	sp, #2
	tnzw	x
	jreq	00103$
	ldw	x, (0x03, sp)
	pushw	x
	call	_isspace
	addw	sp, #2
	tnzw	x
	jrne	00103$
	ldw	x, (0x03, sp)
	pushw	x
	call	_isalnum
	addw	sp, #2
	tnzw	x
	jreq	00104$
00103$:
	clr	a
	jra	00105$
00104$:
	ld	a, #0x01
00105$:
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
