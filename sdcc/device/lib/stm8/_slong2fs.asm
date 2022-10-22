;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:13 2022
;--------------------------------------------------------
	.module _slong2fs
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___slong2fs
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
;	../_slong2fs.c: 79: float __slong2fs (signed long sl) {
;	-----------------------------------------
;	 function __slong2fs
;	-----------------------------------------
___slong2fs:
;	../_slong2fs.c: 80: if (sl<0) 
	tnz	(0x03, sp)
	jrpl	00102$
;	../_slong2fs.c: 81: return -__ulong2fs(-sl);
	ldw	y, (0x05, sp)
	negw	y
	clr	a
	sbc	a, (0x04, sp)
	ld	xl, a
	clr	a
	sbc	a, (0x03, sp)
	ld	xh, a
	pushw	y
	pushw	x
	call	___ulong2fs
	addw	sp, #4
	exgw	x, y
	sllw	x
	ccf
	rrcw	x
	exgw	x, y
	jra	00104$
00102$:
;	../_slong2fs.c: 83: return __ulong2fs(sl);
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	___ulong2fs
	addw	sp, #4
00104$:
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
