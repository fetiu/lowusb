;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:53 2022
;--------------------------------------------------------
	.module isxdigit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isxdigit
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
;	../isxdigit.c: 33: int isxdigit (int c)
;	-----------------------------------------
;	 function isxdigit
;	-----------------------------------------
_isxdigit:
;	../isxdigit.c: 35: return (c >= '0' && c <= '9' || c >= 'a' && c <= 'f' || c >= 'A' && c <= 'F');
	ldw	x, (0x03, sp)
	cpw	x, #0x0030
	jrslt	00111$
	ldw	x, (0x03, sp)
	cpw	x, #0x0039
	jrsle	00104$
00111$:
	ldw	x, (0x03, sp)
	cpw	x, #0x0061
	jrslt	00108$
	ldw	x, (0x03, sp)
	cpw	x, #0x0066
	jrsle	00104$
00108$:
	ldw	x, (0x03, sp)
	cpw	x, #0x0041
	jrslt	00103$
	ldw	x, (0x03, sp)
	cpw	x, #0x0046
	jrsle	00104$
00103$:
	clr	a
	jra	00105$
00104$:
	ld	a, #0x01
00105$:
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
