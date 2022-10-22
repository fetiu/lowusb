;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:29 2022
;--------------------------------------------------------
	.module _uint2fs
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___uint2fs
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
;../_uint2fs.c:54: float __uint2fs (unsigned int ui) {
;	---------------------------------
; Function __uint2fs
; ---------------------------------
___uint2fs_start::
___uint2fs:
;../_uint2fs.c:55: return __ulong2fs(ui);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	de,#0x0000
	push	de
	push	hl
	call	___ulong2fs
	add	sp, #4
	ret
___uint2fs_end::
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
