;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:56 2022
;--------------------------------------------------------
	.module _strrchr
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strrchr
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
;	../_strrchr.c: 34: char * strrchr ( const char * string, int ch )
;	-----------------------------------------
;	 function strrchr
;	-----------------------------------------
_strrchr:
	sub	sp, #4
;	../_strrchr.c: 37: const char * start = string;
	ldw	y, (0x07, sp)
	ldw	(0x01, sp), y
;	../_strrchr.c: 39: while (*string++)                       /* find end of string */
	ldw	x, (0x01, sp)
00101$:
	ld	a, (x)
	incw	x
	tnz	a
	jrne	00101$
;	../_strrchr.c: 42: while (--string != start && *string != ch)
	ldw	(0x03, sp), x
00105$:
	ldw	x, (0x03, sp)
	decw	x
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	cpw	x, (0x09, sp)
	jrne	00135$
	ld	a, #0x01
	jra	00136$
00135$:
	clr	a
00136$:
	ldw	x, (0x03, sp)
	cpw	x, (0x01, sp)
	jreq	00107$
	tnz	a
	jreq	00105$
00107$:
;	../_strrchr.c: 45: if (*string == ch)                      /* char found ? */
	tnz	a
	jreq	00109$
;	../_strrchr.c: 46: return( (char *)string );
	ldw	x, (0x03, sp)
	jra	00110$
00109$:
;	../_strrchr.c: 48: return (NULL) ;
	clrw	x
00110$:
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
