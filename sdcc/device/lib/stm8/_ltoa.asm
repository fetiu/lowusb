;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:41:16 2022
;--------------------------------------------------------
	.module _ltoa
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __ltoa
	.globl __ultoa
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
;	../_ltoa.c: 56: void _ultoa(unsigned long value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _ultoa
;	-----------------------------------------
__ultoa:
	sub	sp, #39
;	../_ltoa.c: 61: do {
	ldw	x, sp
	incw	x
	incw	x
	ldw	(0x26, sp), x
	ld	a, #0x20
	ld	(0x01, sp), a
00103$:
;	../_ltoa.c: 62: unsigned char c = '0' + (value % radix);
	ld	a, (0x30, sp)
	ld	(0x25, sp), a
	clr	(0x24, sp)
	clr	(0x23, sp)
	clr	(0x22, sp)
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	call	__modulong
	addw	sp, #8
	ld	a, xl
	add	a, #0x30
;	../_ltoa.c: 63: if (c > (unsigned char)'9')
	cp	a, #0x39
	jrule	00102$
;	../_ltoa.c: 64: c += 'A' - '9' - 1;
	add	a, #0x07
00102$:
;	../_ltoa.c: 65: buffer[--index] = c;
	dec	(0x01, sp)
	clrw	x
	exg	a, xl
	ld	a, (0x01, sp)
	exg	a, xl
	addw	x, (0x26, sp)
	ld	(x), a
;	../_ltoa.c: 66: value /= radix;
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x2c, sp), x
	ldw	(0x2a, sp), y
;	../_ltoa.c: 67: } while (value);
	ldw	x, (0x2c, sp)
	jrne	00103$
	ldw	x, (0x2a, sp)
	jrne	00103$
;	../_ltoa.c: 69: do {
	ldw	y, (0x2e, sp)
	ld	a, (0x01, sp)
00106$:
;	../_ltoa.c: 70: *string++ = buffer[index];
	clrw	x
	ld	xl, a
	addw	x, (0x26, sp)
	push	a
	ld	a, (x)
	ld	xl, a
	ld	(y), a
	pop	a
	incw	y
;	../_ltoa.c: 71: } while ( ++index != NUMBER_OF_DIGITS );
	inc	a
	cp	a, #0x20
	jrne	00106$
;	../_ltoa.c: 73: *string = 0;  /* string terminator */
	clr	(y)
	addw	sp, #39
	ret
;	../_ltoa.c: 76: void _ltoa(long value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _ltoa
;	-----------------------------------------
__ltoa:
;	../_ltoa.c: 78: if (value < 0 && radix == 10) {
	tnz	(0x03, sp)
	jrpl	00102$
	ld	a, (0x09, sp)
	cp	a, #0x0a
	jrne	00102$
;	../_ltoa.c: 79: *string++ = '-';
	ldw	x, (0x07, sp)
	ld	a, #0x2d
	ld	(x), a
	incw	x
	ldw	(0x07, sp), x
;	../_ltoa.c: 80: value = -value;
	ldw	y, (0x05, sp)
	negw	y
	clr	a
	sbc	a, (0x04, sp)
	ld	xl, a
	clr	a
	sbc	a, (0x03, sp)
	ld	xh, a
	ldw	(0x05, sp), y
	ldw	(0x03, sp), x
00102$:
;	../_ltoa.c: 82: _ultoa(value, string, radix);
	ld	a, (0x09, sp)
	push	a
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	__ultoa
	addw	sp, #7
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
