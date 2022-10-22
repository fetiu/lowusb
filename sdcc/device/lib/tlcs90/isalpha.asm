;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:51 2022
;--------------------------------------------------------
	.module isalpha
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalpha
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
;../isalpha.c:37: int isalpha (int c)
;	---------------------------------
; Function isalpha
; ---------------------------------
_isalpha_start::
_isalpha:
	dec	sp
;../isalpha.c:39: return (isupper (c) || islower (c));
	ld	hl, 3 (sp)
;./../../include/ctype.h:65: return (c >= 'A' && c <= 'Z');
	ld	a,l
	sub	a, #0x41
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00110$
	ld	a,#0x5A
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P,00106$
00110$:
;./../../include/ctype.h:60: return (c >= 'a' && c <= 'z');
	ld	a,l
	sub	a, #0x61
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00113$
	ld	a,#0x7A
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P,00106$
00113$:
;../isalpha.c:39: return (isupper (c) || islower (c));
	ld	a,#0x00
	jr	00107$
00106$:
	ld	a,#0x01
00107$:
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	inc	sp
	ret
_isalpha_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
