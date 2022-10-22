;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:45 2022
;--------------------------------------------------------
	.module sincoshf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sincoshf
	.globl _expf
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
;	../sincoshf.c: 56: float sincoshf(float x, bool iscosh)
;	-----------------------------------------
;	 function sincoshf
;	-----------------------------------------
_sincoshf:
	sub	sp, #64
;	../sincoshf.c: 62: else { y=x;  sign=0; }
	ldw	y, (0x45, sp)
	ldw	(0x3f, sp), y
	ldw	y, (0x43, sp)
	ldw	(0x3d, sp), y
;	../sincoshf.c: 61: if (x<0.0) { y=-x; sign=1; }
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	ld	(0x3c, sp), a
	tnz	(0x3c, sp)
	jreq	00102$
	ldw	y, (0x45, sp)
	ldw	x, (0x43, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x0c, sp), y
	ldw	(0x0a, sp), x
	ld	a, #0x01
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	../sincoshf.c: 62: else { y=x;  sign=0; }
	ldw	y, (0x3f, sp)
	ldw	(0x0c, sp), y
	ldw	y, (0x3d, sp)
	ldw	(0x0a, sp), y
	clr	(0x01, sp)
00103$:
;	../sincoshf.c: 64: if ((y>1.0) || iscosh)
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	ld	(0x3b, sp), a
	tnz	(0x3b, sp)
	jrne	00117$
	tnz	(0x47, sp)
	jrne	00153$
	jp	00118$
00153$:
00117$:
;	../sincoshf.c: 66: if(y>YBAR)
	clrw	x
	pushw	x
	push	#0x10
	push	#0x41
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	ld	(0x3a, sp), a
	tnz	(0x3a, sp)
	jrne	00154$
	jp	00110$
00154$:
;	../sincoshf.c: 68: w=y-K1;
	push	#0x00
	push	#0x73
	push	#0x31
	push	#0x3f
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x38, sp), x
	ldw	(0x36, sp), y
;	../sincoshf.c: 69: if (w>WMAX)
	push	#0xcf
	push	#0xbd
	push	#0x33
	push	#0x42
	ldw	x, (0x3c, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00105$
;	../sincoshf.c: 71: errno=ERANGE;
	ldw	x, #0x0022
	ldw	_errno+0, x
;	../sincoshf.c: 72: z=HUGE_VALF;
	ldw	x, #0xffff
	ldw	(0x34, sp), x
	ldw	x, #0x7f7f
	ldw	(0x32, sp), x
	jp	00111$
00105$:
;	../sincoshf.c: 76: z=expf(w);
	ldw	x, (0x38, sp)
	pushw	x
	ldw	x, (0x38, sp)
	pushw	x
	call	_expf
	addw	sp, #4
	ldw	(0x30, sp), x
	ldw	(0x2e, sp), y
	ldw	y, (0x30, sp)
	ldw	(0x2c, sp), y
	ldw	y, (0x2e, sp)
	ldw	(0x2a, sp), y
;	../sincoshf.c: 77: z+=K3*z;
	ldw	x, (0x2c, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	push	#0x97
	push	#0x08
	push	#0x68
	push	#0x37
	call	___fsmul
	addw	sp, #8
	ldw	(0x28, sp), x
	ldw	(0x26, sp), y
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x24, sp), x
	ldw	(0x22, sp), y
	ldw	y, (0x24, sp)
	ldw	(0x34, sp), y
	ldw	y, (0x22, sp)
	ldw	(0x32, sp), y
	jra	00111$
00110$:
;	../sincoshf.c: 82: z=expf(y);
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_expf
	addw	sp, #4
	ldw	(0x20, sp), x
	ldw	(0x1e, sp), y
	ldw	y, (0x20, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x1e, sp)
	ldw	(0x02, sp), y
;	../sincoshf.c: 83: w=1.0/z;
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	call	___fsdiv
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), y
	ldw	y, (0x1c, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x1a, sp)
	ldw	(0x06, sp), y
;	../sincoshf.c: 84: if(!iscosh) w=-w;
	tnz	(0x47, sp)
	jrne	00108$
	ldw	y, (0x08, sp)
	ldw	x, (0x06, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x08, sp), y
	ldw	(0x06, sp), x
00108$:
;	../sincoshf.c: 85: z=(z+w)*0.5;
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	push	#0x00
	push	#0x3f
	call	___fsmul
	addw	sp, #8
	ldw	(0x34, sp), x
	ldw	(0x32, sp), y
00111$:
;	../sincoshf.c: 87: if(sign) z=-z;
	tnz	(0x01, sp)
	jrne	00157$
	jp	00119$
00157$:
	ldw	y, (0x34, sp)
	ldw	x, (0x32, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x34, sp), y
	ldw	(0x32, sp), x
	jp	00119$
00118$:
;	../sincoshf.c: 91: if (y<EPS)
	clrw	x
	pushw	x
	push	#0x80
	push	#0x39
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jreq	00115$
;	../sincoshf.c: 92: z=x;
	ldw	y, (0x3f, sp)
	ldw	(0x34, sp), y
	ldw	y, (0x3d, sp)
	ldw	(0x32, sp), y
	jp	00119$
00115$:
;	../sincoshf.c: 95: z=x*x;
	ldw	x, (0x45, sp)
	pushw	x
	ldw	x, (0x45, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x18, sp), x
	ldw	(0x16, sp), y
;	../sincoshf.c: 96: z=x+x*z*P(z)/Q(z);
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x14, sp), x
	ldw	(0x12, sp), y
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	push	#0xea
	push	#0xe6
	push	#0x42
	push	#0xbe
	call	___fsmul
	addw	sp, #8
	push	#0xf0
	push	#0x69
	push	#0xe4
	push	#0xc0
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x18, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	push	#0x93
	push	#0x4f
	push	#0x2b
	push	#0xc2
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsdiv
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x49, sp)
	pushw	x
	ldw	x, (0x49, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x34, sp), x
	ldw	(0x32, sp), y
00119$:
;	../sincoshf.c: 99: return z;
	ldw	x, (0x34, sp)
	ldw	y, (0x32, sp)
	addw	sp, #64
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
