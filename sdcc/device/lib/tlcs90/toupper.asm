;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:52 2022
;--------------------------------------------------------
	.module toupper
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _toupper
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
;../toupper.c:33: int toupper (int c)
;	---------------------------------
; Function toupper
; ---------------------------------
_toupper_start::
_toupper:
	dec	sp
;../toupper.c:35: return (islower (c) ? c + ('A' - 'a') : c);
	ld	hl, 3 (sp)
;./../../include/ctype.h:60: return (c >= 'a' && c <= 'z');
	ld	a,l
	sub	a, #0x61
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00104$
	ld	a,#0x7A
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00115$
	xor	a, #0x80
00115$:
	jp	M,00104$
;../toupper.c:35: return (islower (c) ? c + ('A' - 'a') : c);
	ld	bc,#0xFFE0
	add	hl,bc
00104$:
	inc	sp
	ret
_toupper_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
