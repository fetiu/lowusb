;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:52 2022
;--------------------------------------------------------
	.module isalpha
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalpha
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
;	../isalpha.c: 37: int isalpha (int c)
;	-----------------------------------------
;	 function isalpha
;	-----------------------------------------
_isalpha:
;	../isalpha.c: 39: return (isupper (c) || islower (c));
	ldw	x, (0x03, sp)
;	./../../include/ctype.h: 65: return (c >= 'A' && c <= 'Z');
	cpw	x, #0x0041
	jrslt	00110$
	cpw	x, #0x005a
	jrsle	00106$
00110$:
;	./../../include/ctype.h: 60: return (c >= 'a' && c <= 'z');
	cpw	x, #0x0061
	jrslt	00113$
	cpw	x, #0x007a
	jrsle	00106$
00113$:
;	../isalpha.c: 39: return (isupper (c) || islower (c));
	clr	a
	jra	00107$
00106$:
	ld	a, #0x01
00107$:
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
