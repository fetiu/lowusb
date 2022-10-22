;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:41 2022
;--------------------------------------------------------
	.module asincosf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _asincosf
	.globl _ldexpf
	.globl _fabsf
	.globl _sqrtf
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
;	../asincosf.c: 47: float asincosf(float x, bool isacos)
;	-----------------------------------------
;	 function asincosf
;	-----------------------------------------
_asincosf:
	sub	sp, #80
;	../asincosf.c: 51: bool quartPI = isacos;
	ld	a, (0x57, sp)
	ld	(0x01, sp), a
;	../asincosf.c: 56: y = fabsf(x);
	ldw	x, (0x55, sp)
	pushw	x
	ldw	x, (0x55, sp)
	pushw	x
	call	_fabsf
	addw	sp, #4
	ldw	(0x4f, sp), x
	ldw	(0x4d, sp), y
;	../asincosf.c: 57: if (y < EPS)
	clrw	x
	pushw	x
	push	#0x80
	push	#0x39
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jreq	00107$
;	../asincosf.c: 59: r = y;
	ldw	y, (0x4f, sp)
	ldw	(0x4b, sp), y
	ldw	y, (0x4d, sp)
	ldw	(0x49, sp), y
	jp	00108$
00107$:
;	../asincosf.c: 63: if (y > 0.5)
	clrw	x
	pushw	x
	push	#0x00
	push	#0x3f
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00104$
;	../asincosf.c: 65: quartPI = !isacos;
	ld	a, (0x01, sp)
	sub	a, #0x01
	clr	a
	rlc	a
	ld	(0x01, sp), a
;	../asincosf.c: 66: if (y > 1.0)
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00102$
;	../asincosf.c: 68: errno = EDOM;
	ldw	x, #0x0021
	ldw	_errno+0, x
;	../asincosf.c: 69: return 0.0;
	clrw	x
	clrw	y
	jp	00117$
00102$:
;	../asincosf.c: 71: g = (0.5 - y) + 0.5;
	ldw	x, (0x4f, sp)
	pushw	x
	ldw	x, (0x4f, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	call	___fssub
	addw	sp, #8
;	../asincosf.c: 72: g = ldexpf(g, -1);
	push	#0xff
	push	#0xff
	pushw	x
	pushw	y
	call	_ldexpf
	addw	sp, #6
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	../asincosf.c: 73: y = sqrtf(g);
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	_sqrtf
	addw	sp, #4
;	../asincosf.c: 74: y = -(y + y);
	pushw	x
	pushw	y
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	exgw	x, y
	sllw	x
	ccf
	rrcw	x
	ldw	(0x4f, sp), y
	ldw	(0x4d, sp), x
	jra	00105$
00104$:
;	../asincosf.c: 78: g = y * y;
	ldw	x, (0x4f, sp)
	pushw	x
	ldw	x, (0x4f, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
00105$:
;	../asincosf.c: 80: r = y + y * ((P(g) * g) / Q(g));
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	push	#0x65
	push	#0x20
	push	#0x01
	push	#0xbf
	call	___fsmul
	addw	sp, #8
	push	#0x6b
	push	#0x16
	push	#0x6f
	push	#0x3f
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x47, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x4b, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	ldw	(0x43, sp), x
	ldw	(0x41, sp), y
	push	#0x0b
	push	#0x8d
	push	#0xb1
	push	#0xc0
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x3f, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x43, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	push	#0xf0
	push	#0x50
	push	#0xb3
	push	#0x40
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x47, sp)
	pushw	x
	ldw	x, (0x47, sp)
	pushw	x
	call	___fsdiv
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x53, sp)
	pushw	x
	ldw	x, (0x53, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x3b, sp), x
	ldw	(0x49, sp), y
	ldw	y, (0x3b, sp)
	ldw	(0x4b, sp), y
00108$:
;	../asincosf.c: 82: i = quartPI;
	ld	a, (0x01, sp)
;	../asincosf.c: 85: if (x < 0.0)
	push	a
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x5a, sp)
	pushw	x
	ldw	x, (0x5a, sp)
	pushw	x
;	../asincosf.c: 86: r = (b[i] + r) + b[i];
	call	___fslt
	addw	sp, #8
	ld	(0x39, sp), a
	pop	a
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	ldw	(0x36, sp), x
;	../asincosf.c: 83: if (isacos)
	tnz	(0x57, sp)
	jrne	00146$
	jp	00115$
00146$:
;	../asincosf.c: 85: if (x < 0.0)
	tnz	(0x38, sp)
	jreq	00110$
;	../asincosf.c: 86: r = (b[i] + r) + b[i];
	ldw	x, #_asincosf_b_1_24+0
	ldw	(0x34, sp), x
	ldw	x, (0x34, sp)
	addw	x, (0x36, sp)
	ldw	(0x32, sp), x
	ldw	x, (0x32, sp)
	ld	a, (0x3, x)
	ld	(0x31, sp), a
	ld	a, (0x2, x)
	ld	(0x30, sp), a
	ldw	x, (x)
	ldw	(0x2e, sp), x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x34, sp)
	pushw	x
	ldw	x, (0x34, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x2c, sp), x
	ldw	(0x2a, sp), y
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x28, sp), x
	ldw	(0x26, sp), y
	ldw	y, (0x28, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x26, sp)
	ldw	(0x02, sp), y
	jp	00116$
00110$:
;	../asincosf.c: 88: r = (a[i] - r) + a[i];
	ldw	x, #_asincosf_a_1_24+0
	ldw	(0x24, sp), x
	ldw	x, (0x24, sp)
	addw	x, (0x36, sp)
	ldw	(0x22, sp), x
	ldw	x, (0x22, sp)
	ld	a, (0x3, x)
	ld	(0x21, sp), a
	ld	a, (0x2, x)
	ld	(0x20, sp), a
	ldw	x, (x)
	ldw	(0x1e, sp), x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), y
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x18, sp), x
	ldw	(0x16, sp), y
	ldw	y, (0x18, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x16, sp)
	ldw	(0x02, sp), y
	jra	00116$
00115$:
;	../asincosf.c: 92: r = (a[i] + r) + a[i];
	ldw	x, #_asincosf_a_1_24+0
	addw	x, (0x36, sp)
	ld	a, (0x3, x)
	ld	(0x15, sp), a
	ld	a, (0x2, x)
	ld	(0x14, sp), a
	ldw	x, (x)
	ldw	(0x12, sp), x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x4b, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
;	../asincosf.c: 93: if (x < 0.0)
	tnz	(0x38, sp)
	jreq	00116$
;	../asincosf.c: 94: r = -r;
	ldw	y, (0x04, sp)
	ldw	(0x0c, sp), y
	ldw	x, (0x02, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x02, sp), x
	ldw	y, (0x0c, sp)
	ldw	(0x04, sp), y
00116$:
;	../asincosf.c: 96: return r;
	ldw	x, (0x04, sp)
	ldw	y, (0x02, sp)
00117$:
	addw	sp, #80
	ret
	.area CODE
_asincosf_a_1_24:
	.byte #0x00,#0x00,#0x00,#0x00	;  0.000000e+00
	.byte #0x3F,#0x49,#0x0F,#0xDB	;  7.853982e-01
_asincosf_b_1_24:
	.byte #0x3F,#0xC9,#0x0F,#0xDB	;  1.570796e+00
	.byte #0x3F,#0x49,#0x0F,#0xDB	;  7.853982e-01
	.area INITIALIZER
	.area CABS (ABS)
