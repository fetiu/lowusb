;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:52 2022
;--------------------------------------------------------
	.module tolower
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tolower
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
;../tolower.c:33: int tolower (int c)
;	---------------------------------
; Function tolower
; ---------------------------------
_tolower_start::
_tolower:
	dec	sp
;../tolower.c:35: return (isupper (c) ? c + ('a' - 'A') : c);
	ld	hl, 3 (sp)
;./../../include/ctype.h:65: return (c >= 'A' && c <= 'Z');
	ld	a,l
	sub	a, #0x41
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00104$
	ld	a,#0x5A
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00115$
	xor	a, #0x80
00115$:
	jp	M,00104$
;../tolower.c:35: return (isupper (c) ? c + ('a' - 'A') : c);
	ld	bc,#0x0020
	add	hl,bc
00104$:
	inc	sp
	ret
_tolower_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
