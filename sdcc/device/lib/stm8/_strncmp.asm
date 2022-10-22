;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:56 2022
;--------------------------------------------------------
	.module _strncmp
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncmp
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
;	../_strncmp.c: 31: int strncmp ( const char * first, const char * last, size_t count )
;	-----------------------------------------
;	 function strncmp
;	-----------------------------------------
_strncmp:
	sub	sp, #9
;	../_strncmp.c: 33: if (!count)
	ldw	x, (0x10, sp)
	jrne	00114$
;	../_strncmp.c: 34: return(0);
	clrw	x
	jra	00108$
;	../_strncmp.c: 36: while (--count && *first && *first == *last) {
00114$:
	ldw	y, (0x0c, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x0e, sp)
	ldw	(0x06, sp), y
	ldw	y, (0x10, sp)
	ldw	(0x04, sp), y
00105$:
	ldw	x, (0x04, sp)
	decw	x
	ldw	(0x04, sp), x
	ldw	x, (0x08, sp)
	ld	a, (x)
	ldw	x, (0x06, sp)
	push	a
	ld	a, (x)
	ld	(0x04, sp), a
	pop	a
	ldw	x, (0x04, sp)
	jreq	00107$
	tnz	a
	jreq	00107$
	cp	a, (0x03, sp)
	jrne	00107$
;	../_strncmp.c: 37: first++;
	ldw	x, (0x08, sp)
	incw	x
	ldw	(0x08, sp), x
;	../_strncmp.c: 38: last++;
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x06, sp), x
	jra	00105$
00107$:
;	../_strncmp.c: 41: return( *first - *last );
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	a, (0x03, sp)
	ld	(0x02, sp), a
	ld	a, (0x02, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x01, sp), a
	subw	x, (0x01, sp)
00108$:
	addw	sp, #9
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
