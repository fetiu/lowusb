;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:29 2022
;--------------------------------------------------------
	.module _fsneq
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsneq
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
;	../_fsneq.c: 80: char __fsneq (float a1, float a2)
;	-----------------------------------------
;	 function __fsneq
;	-----------------------------------------
___fsneq:
	sub	sp, #24
;	../_fsneq.c: 84: fl1.f = a1;
	ldw	x, sp
	addw	x, #5
	ldw	y, (0x1d, sp)
	ldw	(0x2, x), y
	ldw	y, (0x1b, sp)
	ldw	(x), y
;	../_fsneq.c: 85: fl2.f = a2;
	ldw	x, sp
	incw	x
	ldw	y, (0x21, sp)
	ldw	(0x2, x), y
	ldw	y, (0x1f, sp)
	ldw	(x), y
;	../_fsneq.c: 87: if (fl1.l == fl2.l)
	ldw	x, sp
	addw	x, #5
	ld	a, (0x3, x)
	ld	(0x18, sp), a
	ld	a, (0x2, x)
	ld	(0x17, sp), a
	ldw	x, (x)
	ldw	y, x
	ldw	x, sp
	incw	x
	ld	a, (0x3, x)
	ld	(0x14, sp), a
	ld	a, (0x2, x)
	ld	(0x13, sp), a
	ldw	x, (x)
	ldw	(0x11, sp), x
	ldw	x, (0x17, sp)
	cpw	x, (0x13, sp)
	jrne	00102$
	ldw	x, y
	cpw	x, (0x11, sp)
	jrne	00102$
;	../_fsneq.c: 88: return (0);
	clr	a
	jra	00105$
00102$:
;	../_fsneq.c: 89: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
	ldw	x, sp
	addw	x, #5
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	(0x0f, sp), a
	ldw	x, (x)
	ldw	(0x0d, sp), x
	ldw	x, sp
	incw	x
	ld	a, (0x3, x)
	ld	(0x0c, sp), a
	ld	a, (0x2, x)
	ldw	x, (x)
	ldw	(0x09, sp), x
	or	a, (0x0f, sp)
	ld	yh, a
	ld	a, yl
	or	a, (0x0c, sp)
	ld	yl, a
	ld	a, (0x0e, sp)
	or	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x0d, sp)
	or	a, (0x09, sp)
	and	a, #0x7f
	ld	xh, a
	tnzw	y
	jrne	00104$
	tnzw	x
	jrne	00104$
;	../_fsneq.c: 90: return (0);
	clr	a
	jra	00105$
00104$:
;	../_fsneq.c: 91: return (1);
	ld	a, #0x01
00105$:
	addw	sp, #24
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
