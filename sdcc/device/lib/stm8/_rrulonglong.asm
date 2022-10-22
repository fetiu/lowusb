;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:49 2022
;--------------------------------------------------------
	.module _rrulonglong
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rrulonglong
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
;	../_rrulonglong.c: 35: unsigned long long _rrulonglong(unsigned long long l, signed char s)
;	-----------------------------------------
;	 function _rrulonglong
;	-----------------------------------------
__rrulonglong:
	sub	sp, #47
;	../_rrulonglong.c: 37: uint32_t *const top = (uint32_t *)((char *)(&l) + 4);
	ldw	y, sp
	addw	y, #50
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x07, sp), x
;	../_rrulonglong.c: 38: uint16_t *const middle = (uint16_t *)((char *)(&l) + 3);
	ldw	x, y
	addw	x, #0x0003
	ldw	(0x05, sp), x
;	../_rrulonglong.c: 39: uint32_t *const bottom = (uint32_t *)(&l);
	ldw	x, y
	ldw	(0x03, sp), x
;	../_rrulonglong.c: 40: uint16_t *const b = (uint16_t *)(&l);
	ldw	(0x01, sp), y
;	../_rrulonglong.c: 50: (*bottom) >>= s;
	ld	a, (0x3c, sp)
	ld	(0x2f, sp), a
00103$:
;	../_rrulonglong.c: 42: for(;s >= 16; s -= 16)
	ld	a, (0x2f, sp)
	cp	a, #0x10
	jrslt	00101$
;	../_rrulonglong.c: 44: b[0] = b[1];
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ldw	(0x2d, sp), x
	ldw	x, (0x2d, sp)
	ldw	x, (x)
	ldw	y, (0x01, sp)
	ldw	(y), x
;	../_rrulonglong.c: 45: b[1] = b[2];
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x2b, sp), x
	ldw	x, (0x2b, sp)
	ldw	x, (x)
	ldw	y, (0x2d, sp)
	ldw	(y), x
;	../_rrulonglong.c: 46: b[2] = b[3];
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	ldw	(0x29, sp), x
	ldw	x, (0x29, sp)
	ldw	x, (x)
	ldw	y, (0x2b, sp)
	ldw	(y), x
;	../_rrulonglong.c: 47: b[3] = 0x000000;
	ldw	x, (0x29, sp)
	clr	(0x1, x)
	clr	(x)
;	../_rrulonglong.c: 42: for(;s >= 16; s -= 16)
	ld	a, (0x2f, sp)
	sub	a, #0x10
	ld	(0x2f, sp), a
	jra	00103$
00101$:
;	../_rrulonglong.c: 50: (*bottom) >>= s;
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	ld	a, (0x2f, sp)
	jreq	00118$
00117$:
	srlw	x
	rrcw	y
	dec	a
	jrne	00117$
00118$:
	ldw	(0x25, sp), x
	ldw	x, (0x03, sp)
	ldw	(0x2, x), y
	ldw	y, (0x25, sp)
	ldw	(x), y
;	../_rrulonglong.c: 51: (*middle) |= (((*middle) & 0xffff0000ul) >> s);
	ldw	x, (0x05, sp)
	ldw	x, (x)
	ldw	(0x23, sp), x
	clrw	x
	clr	(0x20, sp)
	clr	a
	ldw	y, x
	ld	(0x1b, sp), a
	ld	a, (0x20, sp)
	push	a
	ld	a, (0x30, sp)
	jreq	00120$
00119$:
	srlw	y
	rrc	(0x1c, sp)
	rrc	(1, sp)
	dec	a
	jrne	00119$
00120$:
	ldw	(0x1a, sp), y
	pop	a
	or	a, (0x24, sp)
	ld	yl, a
	ld	a, (0x23, sp)
	or	a, (0x1b, sp)
	ld	yh, a
	ld	a, xl
	or	a, (0x1a, sp)
	ld	(0x16, sp), a
	ld	a, xh
	or	a, (0x19, sp)
	ldw	x, (0x05, sp)
	ldw	(x), y
;	../_rrulonglong.c: 52: (*top) |= (((*middle) & 0xffff0000ul) >> s);
	ldw	x, (0x07, sp)
	ld	a, (0x3, x)
	ld	(0x14, sp), a
	ld	a, (0x2, x)
	ld	(0x13, sp), a
	ldw	x, (x)
	ldw	(0x11, sp), x
	clrw	x
	clrw	y
	ld	a, (0x2f, sp)
	jreq	00122$
00121$:
	srlw	x
	rrcw	y
	dec	a
	jrne	00121$
00122$:
	rlwa	y
	ld	(0x0f, sp), a
	rrwa	y
	ld	a, yl
	or	a, (0x14, sp)
	ld	yl, a
	ld	a, (0x0f, sp)
	or	a, (0x13, sp)
	ld	yh, a
	ld	a, xl
	or	a, (0x12, sp)
	ld	(0x0a, sp), a
	ld	a, xh
	or	a, (0x11, sp)
	ld	(0x09, sp), a
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
;	../_rrulonglong.c: 54: return(l);
	ldw	x, (0x32, sp)
	ldw	y, (0x3a, sp)
	ldw	(#6, x), y
	ldw	y, (0x38, sp)
	ldw	(#4, x), y
	ldw	y, (0x36, sp)
	ldw	(#2, x), y
	ldw	y, (0x34, sp)
	ldw	(x), y
	addw	sp, #47
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
