;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:27 2022
;--------------------------------------------------------
	.module _fssub
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fssub
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
;	../_fssub.c: 73: float __fssub (float a1, float a2)
;	-----------------------------------------
;	 function __fssub
;	-----------------------------------------
___fssub:
	sub	sp, #4
;	../_fssub.c: 75: float neg = -a1;
	ldw	y, (0x09, sp)
	ldw	x, (0x07, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x01, sp), x
;	../_fssub.c: 76: return -(neg + a2);
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	exgw	x, y
	sllw	x
	ccf
	rrcw	x
	exgw	x, y
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
