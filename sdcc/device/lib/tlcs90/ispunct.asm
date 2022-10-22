;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:52 2022
;--------------------------------------------------------
	.module ispunct
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalnum
	.globl _isspace
	.globl _isprint
	.globl _ispunct
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
;../ispunct.c:33: int ispunct (int c)
;	---------------------------------
; Function ispunct
; ---------------------------------
_ispunct_start::
_ispunct:
;../ispunct.c:35: return (isprint (c) && !isspace (c) && !isalnum (c));
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_isprint
	add	sp, #2
	ld	a,h
	or	a,l
	jr	Z,00103$
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_isspace
	add	sp, #2
	ld	a,h
	or	a,l
	jr	NZ,00103$
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_isalnum
	add	sp, #2
	ld	a,h
	or	a,l
	jr	Z,00104$
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
	ret
_ispunct_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
