;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:30 2022
;--------------------------------------------------------
	.module ldexpf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
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
;	../ldexpf.c: 34: float ldexpf(float x, int pw2)
;	-----------------------------------------
;	 function ldexpf
;	-----------------------------------------
_ldexpf:
	sub	sp, #30
;	../ldexpf.c: 39: fl.f = x;
	ldw	x, sp
	incw	x
	ldw	y, (0x23, sp)
	ldw	(0x2, x), y
	ldw	y, (0x21, sp)
	ldw	(x), y
;	../ldexpf.c: 41: e=(fl.l >> 23) & 0x000000ff;
	ldw	x, sp
	incw	x
	ldw	(0x1d, sp), x
	ldw	x, (0x1d, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	push	a
	ld	a, #0x17
00103$:
	sraw	x
	rrc	(1, sp)
	exg	a, yl
	rrc	a
	exg	a, yl
	dec	a
	jrne	00103$
	pop	a
	clr	a
	ld	yh, a
	clrw	x
	ldw	(0x19, sp), x
;	../ldexpf.c: 42: e+=pw2;
	ldw	x, (0x25, sp)
	ldw	(0x17, sp), x
	clrw	x
	tnz	(0x17, sp)
	jrpl	00105$
	decw	x
00105$:
	addw	y, (0x17, sp)
	ld	a, xl
	adc	a, (0x1a, sp)
	ld	xl, a
	ld	a, xh
	adc	a, (0x19, sp)
;	../ldexpf.c: 43: fl.l= ((e & 0xff) << 23) | (fl.l & 0x807fffff);
	clr	a
	ld	yh, a
	clrw	x
	ld	a, #0x17
00106$:
	sllw	y
	rlcw	x
	dec	a
	jrne	00106$
	ldw	(0x13, sp), y
	ldw	(0x11, sp), x
	ldw	x, (0x1d, sp)
	ld	a, (0x3, x)
	ld	yh, a
	ld	a, (0x2, x)
	ldw	x, (x)
	ld	(0x0f, sp), a
	ld	a, xl
	and	a, #0x7f
	ld	(0x0e, sp), a
	ld	a, xh
	and	a, #0x80
	ldw	x, (0x11, sp)
	ldw	(0x09, sp), x
	ldw	x, (0x13, sp)
	or	a, (0x09, sp)
	ld	(0x05, sp), a
	pushw	y
	ld	a, xl
	or	a, (1, sp)
	popw	y
	ld	yl, a
	ld	a, xh
	or	a, (0x0f, sp)
	ld	yh, a
	ld	a, (0x0a, sp)
	or	a, (0x0e, sp)
	ld	(0x06, sp), a
	ldw	x, (0x1d, sp)
	ldw	(0x2, x), y
	ldw	y, (0x05, sp)
	ldw	(x), y
;	../ldexpf.c: 45: return(fl.f);
	ldw	x, sp
	incw	x
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	exgw	x, y
	addw	sp, #30
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
