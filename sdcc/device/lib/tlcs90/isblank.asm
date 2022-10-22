;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:51 2022
;--------------------------------------------------------
	.module isblank
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isblank
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
;../isblank.c:33: int isblank (int c)
;	---------------------------------
; Function isblank
; ---------------------------------
_isblank_start::
_isblank:
;../isblank.c:35: return (c == ' ' || c == '\t');
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x20
	jr	NZ,00114$
	ld	a,1 (iy)
	or	a, a
	jr	Z,00104$
00114$:
	ld	a,0 (iy)
	sub	a, #0x09
	jr	NZ,00115$
	ld	a,1 (iy)
	or	a, a
	jr	Z,00104$
00115$:
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
_isblank_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
