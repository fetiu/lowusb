;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:14 2022
;--------------------------------------------------------
	.module _fs2sint
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
	.globl ___fs2sint
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
;	../_fs2sint.c: 81: signed int __fs2sint (float f)
;	-----------------------------------------
;	 function __fs2sint
;	-----------------------------------------
___fs2sint:
	sub	sp, #4
;	../_fs2sint.c: 83: signed long sl=__fs2slong(f);
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	___fs2slong
	addw	sp, #4
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../_fs2sint.c: 84: if (sl>=INT_MAX)
	ldw	x, (0x03, sp)
	cpw	x, #0x7fff
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	a, (0x01, sp)
	sbc	a, #0x00
	jrslt	00102$
;	../_fs2sint.c: 85: return INT_MAX;
	ldw	x, #0x7fff
	jra	00105$
00102$:
;	../_fs2sint.c: 86: if (sl<=INT_MIN)
	ldw	x, #0x8000
	cpw	x, (0x03, sp)
	ld	a, #0xff
	sbc	a, (0x02, sp)
	ld	a, #0xff
	sbc	a, (0x01, sp)
	jrslt	00104$
;	../_fs2sint.c: 87: return -INT_MIN;
	ldw	x, #0x8000
	jra	00105$
00104$:
;	../_fs2sint.c: 88: return sl;
	ldw	x, (0x03, sp)
00105$:
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
