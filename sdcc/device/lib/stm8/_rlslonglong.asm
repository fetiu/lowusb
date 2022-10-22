;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:51 2022
;--------------------------------------------------------
	.module _rlslonglong
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __rlslonglong
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
;	../_rlslonglong.c: 35: long long _rlslonglong(long long l, signed char s)
;	-----------------------------------------
;	 function _rlslonglong
;	-----------------------------------------
__rlslonglong:
	sub	sp, #16
;	../_rlslonglong.c: 37: return((unsigned long long)(l) << s);
	ldw	y, (0x1b, sp)
	ldw	(0x0f, sp), y
	ld	a, (0x15, sp)
	ld	(0x09, sp), a
	ldw	x, (0x19, sp)
	ldw	y, (0x17, sp)
	ld	a, (0x16, sp)
	ldw	(0x03, sp), y
	ld	(0x02, sp), a
	ld	a, (0x09, sp)
	ld	(0x01, sp), a
	ldw	y, (0x0f, sp)
	ld	a, (0x1d, sp)
	jreq	00104$
00103$:
	sllw	y
	rlcw	x
	rlc	(0x04, sp)
	rlc	(0x03, sp)
	rlc	(0x02, sp)
	rlc	(0x01, sp)
	dec	a
	jrne	00103$
00104$:
	ldw	(0x05, sp), x
	ldw	x, (0x02, sp)
	ldw	(0x02, sp), x
	ldw	x, (0x13, sp)
	ldw	(#6, x), y
	ldw	y, (0x05, sp)
	ldw	(#4, x), y
	ldw	y, (0x03, sp)
	ldw	(#2, x), y
	ldw	y, (0x01, sp)
	ldw	(x), y
	addw	sp, #16
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
