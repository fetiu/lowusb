;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:53 2022
;--------------------------------------------------------
	.module toupper
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _toupper
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../toupper.c: 33: int toupper (int c)
;	-----------------------------------------
;	 function toupper
;	-----------------------------------------
_toupper:
;	../toupper.c: 35: return (islower (c) ? c + ('A' - 'a') : c);
	ldw	x, (0x03, sp)
;	./../../include/ctype.h: 60: return (c >= 'a' && c <= 'z');
	cpw	x, #0x0061
	jrslt	00104$
	cpw	x, #0x007a
	jrsgt	00104$
;	../toupper.c: 35: return (islower (c) ? c + ('A' - 'a') : c);
	addw	x, #0xffe0
00104$:
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
