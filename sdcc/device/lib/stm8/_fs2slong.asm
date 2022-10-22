;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:14 2022
;--------------------------------------------------------
	.module _fs2slong
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2ulong
	.globl ___fs2slong
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
;	../_fs2slong.c: 108: signed long __fs2slong (float f)
;	-----------------------------------------
;	 function __fs2slong
;	-----------------------------------------
___fs2slong:
	sub	sp, #4
;	../_fs2slong.c: 111: if (!f)
	ldw	x, (0x09, sp)
	jrne	00102$
	ldw	x, (0x07, sp)
	sllw	x
	jrne	00102$
;	../_fs2slong.c: 112: return 0;
	clrw	x
	clrw	y
	jra	00106$
00102$:
;	../_fs2slong.c: 114: if (f<0) {
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jreq	00104$
;	../_fs2slong.c: 115: return -__fs2ulong(-f);
	ldw	y, (0x09, sp)
	ldw	x, (0x07, sp)
	sllw	x
	ccf
	rrcw	x
	pushw	y
	pushw	x
	call	___fs2ulong
	addw	sp, #4
	ldw	(0x01, sp), y
	negw	x
	clr	a
	sbc	a, (0x02, sp)
	ld	yl, a
	clr	a
	sbc	a, (0x01, sp)
	ld	yh, a
	jra	00106$
00104$:
;	../_fs2slong.c: 117: return __fs2ulong(f);
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	___fs2ulong
	addw	sp, #4
00106$:
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
