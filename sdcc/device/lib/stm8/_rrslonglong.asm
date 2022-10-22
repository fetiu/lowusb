;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:50 2022
;--------------------------------------------------------
	.module _rrslonglong
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rrslonglong
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
;	../_rrslonglong.c: 35: long long _rrslonglong(long long l, signed char s)
;	-----------------------------------------
;	 function _rrslonglong
;	-----------------------------------------
__rrslonglong:
	sub	sp, #49
;	../_rrslonglong.c: 37: int32_t *top = (uint32_t *)((char *)(&l) + 4);
	ldw	y, sp
	addw	y, #52
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x07, sp), x
;	../_rrslonglong.c: 38: uint16_t *middle = (uint16_t *)((char *)(&l) + 3);
	ldw	x, y
	addw	x, #0x0003
	ldw	(0x05, sp), x
;	../_rrslonglong.c: 39: uint32_t *bottom = (uint32_t *)(&l);
	ldw	x, y
	ldw	(0x03, sp), x
;	../_rrslonglong.c: 40: uint16_t *b = (uint16_t *)(&l);
	ldw	(0x01, sp), y
;	../_rrslonglong.c: 50: (*bottom) >>= s;
	ld	a, (0x3e, sp)
	ld	(0x31, sp), a
00103$:
;	../_rrslonglong.c: 42: for(;s >= 16; s-= 16)
	ld	a, (0x31, sp)
	cp	a, #0x10
	jrslt	00101$
;	../_rrslonglong.c: 44: b[0] = b[1];
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ldw	(0x2f, sp), x
	ldw	x, (0x2f, sp)
	ldw	x, (x)
	ldw	y, (0x01, sp)
	ldw	(y), x
;	../_rrslonglong.c: 45: b[1] = b[2];
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x2d, sp), x
	ldw	x, (0x2d, sp)
	ldw	x, (x)
	ldw	y, (0x2f, sp)
	ldw	(y), x
;	../_rrslonglong.c: 46: b[2] = b[3];
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	ldw	(0x2b, sp), x
	ldw	x, (0x2b, sp)
	ldw	x, (x)
	ldw	y, (0x2d, sp)
	ldw	(y), x
;	../_rrslonglong.c: 47: b[3] = (b[3] & 0x8000) ? 0xffff : 0x000000;
	ldw	x, (0x2b, sp)
	ldw	x, (x)
	tnzw	x
	jrpl	00107$
	ldw	x, #0xffff
	ldw	(0x29, sp), x
	jra	00108$
00107$:
	clrw	x
	ldw	(0x29, sp), x
00108$:
	ldw	x, (0x2b, sp)
	ldw	y, (0x29, sp)
	ldw	(x), y
;	../_rrslonglong.c: 42: for(;s >= 16; s-= 16)
	ld	a, (0x31, sp)
	sub	a, #0x10
	ld	(0x31, sp), a
	jra	00103$
00101$:
;	../_rrslonglong.c: 50: (*bottom) >>= s;
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	ld	a, (0x31, sp)
	jreq	00125$
00124$:
	srlw	x
	rrcw	y
	dec	a
	jrne	00124$
00125$:
	ldw	(0x27, sp), y
	ldw	(0x25, sp), x
	ldw	x, (0x03, sp)
	ldw	y, (0x27, sp)
	ldw	(0x2, x), y
	ldw	y, (0x25, sp)
	ldw	(x), y
;	../_rrslonglong.c: 51: (*bottom) |= ((uint32_t)((*middle) >> s) << 16);
	ldw	x, (0x05, sp)
	ldw	x, (x)
	ld	a, (0x31, sp)
	jreq	00127$
00126$:
	srlw	x
	dec	a
	jrne	00126$
00127$:
	clrw	y
	ld	a, #0x10
00128$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00128$
	rlwa	y
	ld	(0x21, sp), a
	rrwa	y
	ld	a, yl
	or	a, (0x26, sp)
	ld	(0x1e, sp), a
	ld	a, xl
	or	a, (0x28, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x27, sp)
	ld	yh, a
	ld	a, (0x21, sp)
	or	a, (0x25, sp)
	ld	(0x1d, sp), a
	ldw	x, (0x03, sp)
	ldw	(0x2, x), y
	ldw	y, (0x1d, sp)
	ldw	(x), y
;	../_rrslonglong.c: 52: (*top) |= (((*middle) & 0xffff0000) >> s);
	ldw	x, (0x07, sp)
	ld	a, (0x3, x)
	ld	(0x1c, sp), a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	ldw	(0x19, sp), x
	ldw	x, (0x05, sp)
	ldw	x, (x)
	ldw	(0x17, sp), x
	clrw	x
	clr	(0x14, sp)
	clr	a
	ld	(0x0f, sp), a
	ld	a, (0x14, sp)
	ld	(0x10, sp), a
	ld	a, (0x31, sp)
	jreq	00131$
00130$:
	srlw	x
	rrc	(0x0f, sp)
	rrc	(0x10, sp)
	dec	a
	jrne	00130$
00131$:
	ldw	(0x0d, sp), x
	ld	a, (0x1c, sp)
	ldw	x, (0x19, sp)
	or	a, (0x10, sp)
	ld	yl, a
	ld	a, yh
	or	a, (0x0f, sp)
	ld	yh, a
	ld	a, xl
	or	a, (0x0e, sp)
	ld	(0x0a, sp), a
	ld	a, xh
	or	a, (0x0d, sp)
	ld	(0x09, sp), a
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
;	../_rrslonglong.c: 54: return(l);
	ldw	x, (0x34, sp)
	ldw	y, (0x3c, sp)
	ldw	(#6, x), y
	ldw	y, (0x3a, sp)
	ldw	(#4, x), y
	ldw	y, (0x38, sp)
	ldw	(#2, x), y
	ldw	y, (0x36, sp)
	ldw	(x), y
	addw	sp, #49
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
