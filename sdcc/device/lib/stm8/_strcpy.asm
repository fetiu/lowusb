;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:41:17 2022
;--------------------------------------------------------
	.module _strcpy
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcpy
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
;	../_strcpy.c: 34: char * strcpy ( char * d, const char * s )
;	-----------------------------------------
;	 function strcpy
;	-----------------------------------------
_strcpy:
;	../_strcpy.c: 37: register char * to = d;
	ldw	x, (0x03, sp)
;	../_strcpy.c: 38: register const char * from = s;
	ldw	y, (0x05, sp)
;	../_strcpy.c: 40: while (*to++ = *from++) ;
00101$:
	ld	a, (y)
	incw	y
	ld	(x), a
	incw	x
	tnz	a
	jrne	00101$
;	../_strcpy.c: 42: return d;
	ldw	x, (0x03, sp)
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
