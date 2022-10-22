;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:51 2022
;--------------------------------------------------------
	.module _mullonglong
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullonglong
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
;	../_mullonglong.c: 35: long long _mullonglong(long long ll, long long lr)
;	-----------------------------------------
;	 function _mullonglong
;	-----------------------------------------
__mullonglong:
	sub	sp, #36
;	../_mullonglong.c: 37: unsigned long long ret = 0ull;
	clrw	x
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), x
	ldw	(0x07, sp), x
;	../_mullonglong.c: 38: unsigned char *l = (unsigned char *)(&ll);
	ldw	x, sp
	addw	x, #39
	ldw	(0x05, sp), x
;	../_mullonglong.c: 39: unsigned char *r = (unsigned char *)(&lr);
	ldw	x, sp
	addw	x, #47
	ldw	(0x03, sp), x
;	../_mullonglong.c: 42: for (i = 0; i < sizeof (long long); i++)
	clr	(0x02, sp)
;	../_mullonglong.c: 44: for(j = 0; (i + j) < sizeof (long long); j++)
00111$:
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x05, sp)
	ldw	(0x23, sp), x
	clr	(0x01, sp)
00104$:
	ld	a, (0x02, sp)
	ld	(0x22, sp), a
	clr	(0x21, sp)
	ld	a, (0x01, sp)
	ld	(0x20, sp), a
	clr	(0x1f, sp)
	ldw	x, (0x21, sp)
	addw	x, (0x1f, sp)
	cpw	x, #0x0008
	jrsge	00107$
;	../_mullonglong.c: 45: ret += ((unsigned short)(l[i] * r [j])) << ((i + j) * 8);
	ldw	y, (0x23, sp)
	ld	a, (y)
	clrw	y
	exg	a, yl
	ld	a, (0x01, sp)
	exg	a, yl
	addw	y, (0x03, sp)
	push	a
	ld	a, (y)
	ld	yl, a
	pop	a
	mul	y, a
	sllw	x
	sllw	x
	sllw	x
	ld	a, xl
	tnz	a
	jreq	00130$
00129$:
	sllw	y
	dec	a
	jrne	00129$
00130$:
	clrw	x
	clr	(0x1a, sp)
	clr	(0x19, sp)
	clr	(0x18, sp)
	clr	(0x17, sp)
	addw	y, (0x0d, sp)
	ldw	(0x15, sp), y
	ld	a, xl
	adc	a, (0x0c, sp)
	ld	(0x14, sp), a
	ld	a, xh
	adc	a, (0x0b, sp)
	push	a
	ld	a, (0x1b, sp)
	adc	a, (0x0b, sp)
	ld	yl, a
	ld	a, (0x1a, sp)
	adc	a, (0x0a, sp)
	ld	yh, a
	ld	a, (0x19, sp)
	adc	a, (0x09, sp)
	ld	xl, a
	ld	a, (0x18, sp)
	adc	a, (0x08, sp)
	ld	xh, a
	pop	a
	ld	(0x0b, sp), a
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
	ldw	y, (0x15, sp)
	ldw	(0x0d, sp), y
	ld	a, (0x14, sp)
	ld	(0x0c, sp), a
;	../_mullonglong.c: 44: for(j = 0; (i + j) < sizeof (long long); j++)
	inc	(0x01, sp)
	jra	00104$
00107$:
;	../_mullonglong.c: 42: for (i = 0; i < sizeof (long long); i++)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrnc	00131$
	jp	00111$
00131$:
;	../_mullonglong.c: 48: return(ret);
	ldw	x, (0x27, sp)
	ldw	y, (0x0d, sp)
	ldw	(#6, x), y
	ldw	y, (0x0b, sp)
	ldw	(#4, x), y
	ldw	y, (0x09, sp)
	ldw	(#2, x), y
	ldw	y, (0x07, sp)
	ldw	(x), y
	addw	sp, #36
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
