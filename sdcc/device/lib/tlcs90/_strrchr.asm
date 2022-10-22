;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:54 2022
;--------------------------------------------------------
	.module _strrchr
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strrchr
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_strrchr.c:34: char * strrchr ( const char * string, int ch )
;	---------------------------------
; Function strrchr
; ---------------------------------
_strrchr_start::
_strrchr:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-2
;../_strrchr.c:37: const char * start = string;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strrchr.c:39: while (*string++)                       /* find end of string */
	pop	hl
	push	hl
00101$:
	ld	a,(hl)
	inc	hl
	or	a, a
	jr	NZ,00101$
;../_strrchr.c:42: while (--string != start && *string != ch)
	ld	c, l
	ld	b, h
00105$:
	dec	bc
	ld	a,(bc)
	ld	d,a
	rla
	sbc	a, a
	ld	e,a
	ld	a,6 (ix)
	sub	a, d
	jr	NZ,00133$
	ld	a,7 (ix)
	sub	a, e
	jr	NZ,00133$
	ld	a,#0x01
	jr	00134$
00133$:
	xor	a,a
00134$:
	ld	d,a
	ld	a,-2 (ix)
	sub	a, c
	jr	NZ,00135$
	ld	a,-1 (ix)
	sub	a, b
	jr	Z,00107$
00135$:
	ld	a,d
	or	a, a
	jp	Z,00105$
00107$:
;../_strrchr.c:45: if (*string == ch)                      /* char found ? */
	ld	a,d
	or	a, a
	jr	Z,00109$
;../_strrchr.c:46: return( (char *)string );
	ld	l, c
	ld	h, b
	jr	00110$
00109$:
;../_strrchr.c:48: return (NULL) ;
	ld	hl,#0x0000
00110$:
	ld	sp, ix
	pop	ix
	ret
_strrchr_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
