;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:56 2022
;--------------------------------------------------------
	.module _strncpy
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncpy
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
;	../_strncpy.c: 33: char *strncpy ( char * d, const char * s, size_t n )
;	-----------------------------------------
;	 function strncpy
;	-----------------------------------------
_strncpy:
	sub	sp, #10
;	../_strncpy.c: 35: register char * d1 =  d;
	ldw	y, (0x0d, sp)
	ldw	(0x01, sp), y
;	../_strncpy.c: 37: while ( n && *s )
	ldw	y, (0x11, sp)
	ldw	(0x09, sp), y
	ldw	y, (0x0f, sp)
	ldw	(0x07, sp), y
	ldw	x, (0x01, sp)
00102$:
	ldw	y, (0x09, sp)
	jreq	00114$
	ldw	y, (0x07, sp)
	ld	a, (y)
	tnz	a
	jreq	00114$
;	../_strncpy.c: 39: n-- ;
	ldw	y, (0x09, sp)
	decw	y
	ldw	(0x09, sp), y
;	../_strncpy.c: 40: *d++ = *s++ ;
	ldw	y, (0x07, sp)
	incw	y
	ldw	(0x07, sp), y
	ld	(x), a
	incw	x
	jra	00102$
;	../_strncpy.c: 42: while ( n-- )
00114$:
	ldw	y, (0x09, sp)
	ldw	(0x05, sp), y
00105$:
	ldw	y, (0x05, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x05, sp)
	decw	y
	ldw	(0x05, sp), y
	ldw	y, (0x03, sp)
	jreq	00107$
;	../_strncpy.c: 44: *d++ = '\0' ;
	clr	(x)
	incw	x
	jra	00105$
00107$:
;	../_strncpy.c: 46: return d1;
	ldw	x, (0x01, sp)
	addw	sp, #10
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
