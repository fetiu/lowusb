;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:51 2022
;--------------------------------------------------------
	.module isalnum
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalpha
	.globl _isalnum
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
;../isalnum.c:37: int isalnum (int c)
;	---------------------------------
; Function isalnum
; ---------------------------------
_isalnum_start::
_isalnum:
	dec	sp
;../isalnum.c:39: return (isalpha (c) || isdigit (c));
	ld	hl, 3 (sp)
	push	hl
	call	_isalpha
	add	sp, #2
	ld	a,h
	or	a,l
	jr	NZ,00105$
	ld	hl, 3 (sp)
;./../../include/ctype.h:55: return (c >= '0' && c <= '9');
	ld	a,l
	sub	a, #0x30
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
	ld	a,#0x39
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00119$
	xor	a, #0x80
00119$:
	jp	P,00105$
00109$:
;../isalnum.c:39: return (isalpha (c) || isdigit (c));
	ld	a,#0x00
	jr	00106$
00105$:
	ld	a,#0x01
00106$:
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	inc	sp
	ret
_isalnum_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
