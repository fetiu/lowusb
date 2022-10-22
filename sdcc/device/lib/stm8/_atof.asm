;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:13 2022
;--------------------------------------------------------
	.module _atof
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atoi
	.globl _toupper
	.globl _isspace
	.globl _atof
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
;	../_atof.c: 33: float atof(const char * s)
;	-----------------------------------------
;	 function atof
;	-----------------------------------------
_atof:
	sub	sp, #33
;	../_atof.c: 40: while (isspace(*s)) s++;
	ldw	y, (0x24, sp)
00101$:
	ld	a, (y)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	pushw	y
	pushw	x
	call	_isspace
	addw	sp, #2
	ldw	(0x22, sp), x
	popw	y
	ldw	x, y
	incw	x
	ldw	(0x1e, sp), x
	ldw	x, (0x20, sp)
	jreq	00145$
	ldw	y, (0x1e, sp)
	jra	00101$
00145$:
	ldw	(0x24, sp), y
;	../_atof.c: 43: if (*s == '-')
	ld	a, (y)
	cp	a, #0x2d
	jrne	00107$
;	../_atof.c: 45: sign=1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	../_atof.c: 46: s++;
	ldw	y, (0x1e, sp)
	ldw	(0x24, sp), y
	jra	00108$
00107$:
;	../_atof.c: 50: sign=0;
	clr	(0x01, sp)
;	../_atof.c: 51: if (*s == '+') s++;
	cp	a, #0x2b
	jrne	00108$
	ldw	y, (0x1e, sp)
	ldw	(0x24, sp), y
00108$:
;	../_atof.c: 55: for (value=0.0; isdigit(*s); s++)
	clrw	x
	ldw	(0x09, sp), x
	ldw	(0x07, sp), x
	ldw	y, (0x24, sp)
	ldw	(0x1c, sp), y
00124$:
	ldw	x, (0x1c, sp)
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	pushw	x
	call	_isdigit
	addw	sp, #2
	ldw	y, (0x1c, sp)
	ld	a, (y)
	ldw	y, (0x1c, sp)
	incw	y
	ldw	(0x1a, sp), y
	tnzw	x
	jreq	00146$
;	../_atof.c: 57: value=10.0*value+(*s-'0');
	push	a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	call	___fsmul
	addw	sp, #8
	ldw	(0x19, sp), x
	ldw	(0x17, sp), y
	pop	a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	subw	x, #0x0030
	pushw	x
	call	___sint2fs
	addw	sp, #2
	pushw	x
	pushw	y
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	../_atof.c: 55: for (value=0.0; isdigit(*s); s++)
	ldw	y, (0x1a, sp)
	ldw	(0x1c, sp), y
	jra	00124$
00146$:
	ldw	y, (0x1c, sp)
	ldw	(0x24, sp), y
;	../_atof.c: 61: if (*s == '.')
	cp	a, #0x2e
	jreq	00200$
	jp	00112$
00200$:
;	../_atof.c: 64: for (fraction=0.1; isdigit(*s); s++)
	ldw	x, #0xcccd
	ldw	(0x05, sp), x
	ldw	x, #0x3dcc
	ldw	(0x03, sp), x
	ldw	y, (0x1a, sp)
	ldw	(0x14, sp), y
00127$:
	ldw	x, (0x14, sp)
	ld	a, (x)
	ld	(0x13, sp), a
	ld	a, (0x13, sp)
	ld	(0x12, sp), a
	ld	a, (0x12, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x11, sp), a
	ldw	x, (0x11, sp)
	pushw	x
	call	_isdigit
	addw	sp, #2
	tnzw	x
	jreq	00147$
;	../_atof.c: 66: value+=(*s-'0')*fraction;
	ldw	x, (0x14, sp)
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	subw	x, #0x0030
	pushw	x
	call	___sint2fs
	addw	sp, #2
	ldw	(0x0f, sp), x
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	../_atof.c: 67: fraction*=0.1;
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	push	#0xcd
	push	#0xcc
	push	#0xcc
	push	#0x3d
	call	___fsmul
	addw	sp, #8
	ldw	(0x05, sp), x
	ldw	(0x03, sp), y
;	../_atof.c: 64: for (fraction=0.1; isdigit(*s); s++)
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x14, sp), x
	jra	00127$
00147$:
	ldw	y, (0x14, sp)
	ldw	(0x24, sp), y
00112$:
;	../_atof.c: 72: if (toupper(*s)=='E')
	ldw	y, (0x24, sp)
	ldw	(0x0b, sp), y
	ldw	x, (0x0b, sp)
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	pushw	x
	call	_toupper
	addw	sp, #2
	cpw	x, #0x0045
	jrne	00120$
;	../_atof.c: 74: s++;
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x24, sp), x
;	../_atof.c: 75: iexp=(signed char)atoi(s);
	ldw	x, (0x24, sp)
	pushw	x
	call	_atoi
	addw	sp, #2
	ld	a, xl
	ld	(0x02, sp), a
;	../_atof.c: 77: while(iexp!=0)
00116$:
	tnz	(0x02, sp)
	jreq	00120$
;	../_atof.c: 79: if(iexp<0)
	tnz	(0x02, sp)
	jrpl	00114$
;	../_atof.c: 81: value*=0.1;
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	push	#0xcd
	push	#0xcc
	push	#0xcc
	push	#0x3d
	call	___fsmul
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	../_atof.c: 82: iexp++;
	ld	a, (0x02, sp)
	inc	a
	ld	(0x02, sp), a
	jra	00116$
00114$:
;	../_atof.c: 86: value*=10.0;
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	call	___fsmul
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	../_atof.c: 87: iexp--;
	ld	a, (0x02, sp)
	dec	a
	ld	(0x02, sp), a
	jra	00116$
00120$:
;	../_atof.c: 93: if(sign) value*=-1.0;
	tnz	(0x01, sp)
	jreq	00122$
	ldw	y, (0x09, sp)
	ldw	x, (0x07, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
00122$:
;	../_atof.c: 94: return (value);
	ldw	x, (0x09, sp)
	ldw	y, (0x07, sp)
	addw	sp, #33
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
