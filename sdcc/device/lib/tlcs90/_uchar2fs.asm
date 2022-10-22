;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:29 2022
;--------------------------------------------------------
	.module _uchar2fs
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___ulong2fs
	.globl ___uchar2fs
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
;../_uchar2fs.c:55: float __uchar2fs (unsigned char uc) {
;	---------------------------------
; Function __uchar2fs
; ---------------------------------
___uchar2fs_start::
___uchar2fs:
;../_uchar2fs.c:56: return __ulong2fs(uc);
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,#0x00
	ld	de,#0x0000
	push	de
	push	hl
	call	___ulong2fs
	add	sp, #4
	ret
___uchar2fs_end::
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
