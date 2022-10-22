;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:51 2022
;--------------------------------------------------------
	.module iscntrl
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _iscntrl
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
;../iscntrl.c:33: int iscntrl (int c)
;	---------------------------------
; Function iscntrl
; ---------------------------------
_iscntrl_start::
_iscntrl:
;../iscntrl.c:35: return (c < ' ' || c == 0x7f);
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x20
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00104$
	ld	a,0 (iy)
	sub	a, #0x7F
	jr	NZ,00114$
	ld	a,1 (iy)
	or	a, a
	jr	Z,00104$
00114$:
	ld	a,#0x00
	jr	00105$
00104$:
	ld	a,#0x01
00105$:
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ret
_iscntrl_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
