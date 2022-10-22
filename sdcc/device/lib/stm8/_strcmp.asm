;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:55 2022
;--------------------------------------------------------
	.module _strcmp
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcmp
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
;	../_strcmp.c: 34: int strcmp ( const char * asrc, const char * adst )
;	-----------------------------------------
;	 function strcmp
;	-----------------------------------------
_strcmp:
	sub	sp, #10
;	../_strcmp.c: 40: const char * src = asrc;
	ldw	y, (0x0d, sp)
	ldw	(0x03, sp), y
;	../_strcmp.c: 41: const char * dst = adst;
	ldw	y, (0x0f, sp)
	ldw	(0x01, sp), y
;	../_strcmp.c: 43: while( ! (*src - *dst) && *dst)
00102$:
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ldw	y, (0x01, sp)
	ld	a, (y)
	ld	(0x0a, sp), a
	push	a
	ld	a, (0x0b, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x0a, sp), a
	pop	a
	subw	x, (0x09, sp)
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	jrne	00104$
	tnz	a
	jreq	00104$
;	../_strcmp.c: 44: ++src, ++dst;
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x05, sp), x
	ldw	y, (0x05, sp)
	ldw	(0x03, sp), y
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00102$
00104$:
;	../_strcmp.c: 46: return *src - *dst;
	ldw	x, (0x07, sp)
	addw	sp, #10
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
