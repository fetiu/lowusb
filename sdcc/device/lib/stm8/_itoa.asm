;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:41:16 2022
;--------------------------------------------------------
	.module _itoa
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __itoa
	.globl __uitoa
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
;	../_itoa.c: 40: void _uitoa(unsigned int value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _uitoa
;	-----------------------------------------
__uitoa:
	sub	sp, #6
;	../_itoa.c: 45: do {
	clr	(0x03, sp)
00103$:
;	../_itoa.c: 46: string[index] = '0' + (value % radix);
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x0b, sp)
	ld	a, (0x0d, sp)
	ld	(0x06, sp), a
	clr	(0x05, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	ldw	y, (0x07, sp)
	divw	x, y
	popw	x
	ld	a, yl
	add	a, #0x30
	ld	(x), a
;	../_itoa.c: 47: if (string[index] > '9')
	cp	a, #0x39
	jrsle	00102$
;	../_itoa.c: 48: string[index] += 'A' - '9' - 1;
	ld	a, (x)
	add	a, #0x07
	ld	(x), a
00102$:
;	../_itoa.c: 49: value /= radix;
	ldw	x, (0x09, sp)
	ldw	y, (0x05, sp)
	divw	x, y
	ldw	(0x09, sp), x
;	../_itoa.c: 50: ++index;
	inc	(0x03, sp)
;	../_itoa.c: 51: } while (value != 0);
	ldw	x, (0x09, sp)
	jrne	00103$
;	../_itoa.c: 54: string[index--] = '\0';
	ld	a, (0x03, sp)
	dec	a
	clrw	x
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
	addw	x, (0x0b, sp)
	clr	(x)
;	../_itoa.c: 57: while (index > i) {
	clr	(0x02, sp)
	ld	(0x04, sp), a
00106$:
	ld	a, (0x04, sp)
	cp	a, (0x02, sp)
	jrsle	00109$
;	../_itoa.c: 58: char tmp = string[i];
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x0b, sp)
	ld	a, (x)
	ld	(0x01, sp), a
;	../_itoa.c: 59: string[i] = string[index];
	clrw	y
	ld	a, (0x04, sp)
	ld	yl, a
	addw	y, (0x0b, sp)
	ld	a, (y)
	ld	(x), a
;	../_itoa.c: 60: string[index] = tmp;
	ld	a, (0x01, sp)
	ld	(y), a
;	../_itoa.c: 61: ++i;
	inc	(0x02, sp)
;	../_itoa.c: 62: --index;
	dec	(0x04, sp)
	jra	00106$
00109$:
	addw	sp, #6
	ret
;	../_itoa.c: 66: void _itoa(int value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _itoa
;	-----------------------------------------
__itoa:
;	../_itoa.c: 68: if (value < 0 && radix == 10) {
	tnz	(0x03, sp)
	jrpl	00102$
	ld	a, (0x07, sp)
	cp	a, #0x0a
	jrne	00102$
;	../_itoa.c: 69: *string++ = '-';
	ldw	x, (0x05, sp)
	ld	a, #0x2d
	ld	(x), a
	incw	x
	ldw	(0x05, sp), x
;	../_itoa.c: 70: value = -value;
	ldw	x, (0x03, sp)
	negw	x
	ldw	(0x03, sp), x
00102$:
;	../_itoa.c: 72: _uitoa(value, string, radix);
	ld	a, (0x07, sp)
	push	a
	ldw	x, (0x06, sp)
	pushw	x
	ldw	x, (0x06, sp)
	pushw	x
	call	__uitoa
	addw	sp, #5
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
