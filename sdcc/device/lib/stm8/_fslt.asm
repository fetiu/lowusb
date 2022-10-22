;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:29 2022
;--------------------------------------------------------
	.module _fslt
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fslt
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
;	../_fslt.c: 108: char __fslt (float a1, float a2)
;	-----------------------------------------
;	 function __fslt
;	-----------------------------------------
___fslt:
	sub	sp, #56
;	../_fslt.c: 112: fl1.f = a1;
	ldw	x, sp
	addw	x, #5
	ldw	y, (0x3d, sp)
	ldw	(0x2, x), y
	ldw	y, (0x3b, sp)
	ldw	(x), y
;	../_fslt.c: 113: fl2.f = a2;
	ldw	x, sp
	incw	x
	ldw	y, (0x41, sp)
	ldw	(0x2, x), y
	ldw	y, (0x3f, sp)
	ldw	(x), y
;	../_fslt.c: 115: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
	ldw	x, sp
	addw	x, #5
	ld	a, (0x3, x)
	ld	(0x38, sp), a
	ld	a, (0x2, x)
	ld	(0x37, sp), a
	ldw	x, (x)
	ldw	(0x35, sp), x
	ldw	x, sp
	incw	x
	ld	a, (0x3, x)
	push	a
	ld	a, (0x2, x)
	ld	(0x34, sp), a
	ldw	x, (x)
	pop	a
	or	a, (0x38, sp)
	ld	yl, a
	ld	a, (0x33, sp)
	or	a, (0x37, sp)
	ld	yh, a
	ld	a, xl
	or	a, (0x36, sp)
	ld	(0x2e, sp), a
	ld	a, xh
	or	a, (0x35, sp)
	and	a, #0x7f
	ld	(0x29, sp), a
	ldw	(0x2b, sp), y
	ld	a, (0x2e, sp)
	ld	(0x2a, sp), a
	ldw	x, (0x2b, sp)
	jrne	00102$
	ldw	x, (0x29, sp)
	jrne	00102$
;	../_fslt.c: 116: return (0);
	clr	a
	jp	00110$
00102$:
;	../_fslt.c: 118: if (fl1.l<0 && fl2.l<0) {
	ldw	x, sp
	addw	x, #5
	ldw	(0x27, sp), x
	ldw	x, (0x27, sp)
	ld	a, (0x3, x)
	ld	(0x26, sp), a
	ld	a, (0x2, x)
	ld	(0x25, sp), a
	ldw	x, (x)
	ldw	(0x23, sp), x
	tnz	(0x23, sp)
	jrpl	00106$
	ldw	x, sp
	incw	x
	ldw	(0x21, sp), x
	ldw	x, (0x21, sp)
	ld	a, (0x3, x)
	ld	(0x20, sp), a
	ld	a, (0x2, x)
	ld	(0x1f, sp), a
	ldw	x, (x)
	ldw	(0x1d, sp), x
	tnz	(0x1d, sp)
	jrpl	00106$
;	../_fslt.c: 119: if (fl2.l < fl1.l)
	ldw	x, sp
	incw	x
	ldw	(0x1b, sp), x
	ldw	x, (0x1b, sp)
	ld	a, (0x3, x)
	ld	(0x1a, sp), a
	ld	a, (0x2, x)
	ld	(0x19, sp), a
	ldw	x, (x)
	ldw	(0x17, sp), x
	ldw	x, sp
	addw	x, #5
	ldw	(0x15, sp), x
	ldw	x, (0x15, sp)
	ld	a, (0x3, x)
	ld	(0x14, sp), a
	ld	a, (0x2, x)
	ld	(0x13, sp), a
	ldw	x, (x)
	ldw	(0x11, sp), x
	ldw	x, (0x19, sp)
	cpw	x, (0x13, sp)
	ld	a, (0x18, sp)
	sbc	a, (0x12, sp)
	ld	a, (0x17, sp)
	sbc	a, (0x11, sp)
	jrsge	00104$
;	../_fslt.c: 120: return (1);
	ld	a, #0x01
	jra	00110$
00104$:
;	../_fslt.c: 121: return (0);
	clr	a
	jra	00110$
00106$:
;	../_fslt.c: 124: if (fl1.l < fl2.l)
	ldw	x, sp
	addw	x, #5
	ld	a, (0x3, x)
	ld	(0x10, sp), a
	ld	a, (0x2, x)
	ld	(0x0f, sp), a
	ldw	x, (x)
	ldw	y, x
	ldw	x, sp
	incw	x
	ld	a, (0x3, x)
	ld	(0x0c, sp), a
	ld	a, (0x2, x)
	ld	(0x0b, sp), a
	ldw	x, (x)
	ldw	(0x09, sp), x
	ldw	x, (0x0f, sp)
	cpw	x, (0x0b, sp)
	ld	a, yl
	sbc	a, (0x0a, sp)
	ld	a, yh
	sbc	a, (0x09, sp)
	jrsge	00109$
;	../_fslt.c: 125: return (1);
	ld	a, #0x01
	jra	00110$
00109$:
;	../_fslt.c: 126: return (0);
	clr	a
00110$:
	addw	sp, #56
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
