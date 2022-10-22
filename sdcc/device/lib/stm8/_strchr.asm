;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:55 2022
;--------------------------------------------------------
	.module _strchr
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strchr
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
;	../_strchr.c: 36: char * strchr ( const char * string, int ch )
;	-----------------------------------------
;	 function strchr
;	-----------------------------------------
_strchr:
	push	a
;	../_strchr.c: 39: while (*string && *string != ch)
	ldw	y, (0x04, sp)
00102$:
	ld	a, (y)
	ld	(0x01, sp), a
	ld	a, (0x01, sp)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	cpw	x, (0x06, sp)
	jrne	00127$
	ld	a, #0x01
	jra	00128$
00127$:
	clr	a
00128$:
	tnz	(0x01, sp)
	jreq	00104$
	tnz	a
	jrne	00104$
;	../_strchr.c: 40: string++;
	incw	y
	jra	00102$
00104$:
;	../_strchr.c: 42: if (*string == ch)
	tnz	a
	jreq	00106$
;	../_strchr.c: 43: return(string);
	ldw	x, y
	jra	00107$
00106$:
;	../_strchr.c: 44: return ( NULL );
	clrw	x
00107$:
	pop	a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
