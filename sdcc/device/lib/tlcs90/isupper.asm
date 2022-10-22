;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:52 2022
;--------------------------------------------------------
	.module isupper
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isupper
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
;./../../include/ctype.h:63: inline int isupper (int c)
;	---------------------------------
; Function isupper
; ---------------------------------
_isupper_start::
_isupper:
	dec	sp
;./../../include/ctype.h:65: return (c >= 'A' && c <= 'Z');
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x41
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
	ld	a,#0x5A
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P,00104$
00103$:
	ld	a,#0x00
	jr	00105$
00104$:
	ld	a,#0x01
00105$:
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	inc	sp
	ret
_isupper_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
