;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:29 2022
;--------------------------------------------------------
	.module _sint2fs
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
	.globl ___sint2fs
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
;../_sint2fs.c:54: float __sint2fs (signed int si) {
;	---------------------------------
; Function __sint2fs
; ---------------------------------
___sint2fs_start::
___sint2fs:
;../_sint2fs.c:55: return __slong2fs(si);
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	a,1 (iy)
	rla
	sbc	a, a
	ld	e,a
	ld	d,a
	push	de
	push	hl
	call	___slong2fs
	add	sp, #4
	ret
___sint2fs_end::
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
