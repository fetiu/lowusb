;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:34 2022
;--------------------------------------------------------
	.module sincosf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sincosf
	.globl _fabsf
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
;	../sincosf.c: 50: float sincosf(float x, bool iscos)
;	-----------------------------------------
;	 function sincosf
;	-----------------------------------------
_sincosf:
	sub	sp, #58
;	../sincosf.c: 56: if(iscos)
	tnz	(0x41, sp)
	jreq	00105$
;	../sincosf.c: 58: y=fabsf(x)+HALF_PI;
	ldw	x, (0x3f, sp)
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
	call	_fabsf
	addw	sp, #4
	push	#0xdb
	push	#0x0f
	push	#0xc9
	push	#0x3f
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x39, sp), x
	ldw	(0x37, sp), y
;	../sincosf.c: 59: sign=0;
	clr	(0x01, sp)
	jra	00106$
00105$:
;	../sincosf.c: 63: if(x<0.0)
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x43, sp)
	pushw	x
	ldw	x, (0x43, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jreq	00102$
;	../sincosf.c: 64: { y=-x; sign=1; }
	ldw	y, (0x3f, sp)
	ldw	x, (0x3d, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x39, sp), y
	ldw	(0x37, sp), x
	ld	a, #0x01
	ld	(0x01, sp), a
	jra	00106$
00102$:
;	../sincosf.c: 66: { y=x; sign=0; }
	ldw	y, (0x3f, sp)
	ldw	(0x39, sp), y
	ldw	y, (0x3d, sp)
	ldw	(0x37, sp), y
	clr	(0x01, sp)
00106$:
;	../sincosf.c: 69: if(y>YMAX)
	push	#0x00
	push	#0x0c
	push	#0x49
	push	#0x46
	ldw	x, (0x3d, sp)
	pushw	x
	ldw	x, (0x3d, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	ld	(0x36, sp), a
	tnz	(0x36, sp)
	jreq	00108$
;	../sincosf.c: 71: errno=ERANGE;
	ldw	x, #0x0022
	ldw	_errno+0, x
;	../sincosf.c: 72: return 0.0;
	clrw	x
	clrw	y
	jp	00115$
00108$:
;	../sincosf.c: 76: N=((y*iPI)+0.5); /*y is positive*/
	ldw	x, (0x39, sp)
	pushw	x
	ldw	x, (0x39, sp)
	pushw	x
	push	#0x83
	push	#0xf9
	push	#0xa2
	push	#0x3e
	call	___fsmul
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x3f
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	pushw	x
	pushw	y
	call	___fs2sint
	addw	sp, #4
;	../sincosf.c: 79: if(N&1) sign=!sign;
	ld	a, xl
	srl	a
	jrnc	00110$
	ld	a, (0x01, sp)
	sub	a, #0x01
	clr	a
	rlc	a
	ld	(0x01, sp), a
00110$:
;	../sincosf.c: 81: XN=N;
	pushw	x
	call	___sint2fs
	addw	sp, #2
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
;	../sincosf.c: 83: if(iscos) XN-=0.5;
	tnz	(0x41, sp)
	jreq	00112$
	clrw	x
	pushw	x
	push	#0x00
	push	#0x3f
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x34, sp), x
	ldw	(0x32, sp), y
	ldw	y, (0x34, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x32, sp)
	ldw	(0x02, sp), y
00112$:
;	../sincosf.c: 85: y=fabsf(x);
	ldw	x, (0x3f, sp)
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
	call	_fabsf
	addw	sp, #4
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
;	../sincosf.c: 86: r=(int)y;
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fs2sint
	addw	sp, #4
	pushw	x
	call	___sint2fs
	addw	sp, #2
	ldw	(0x30, sp), x
	ldw	(0x2e, sp), y
;	../sincosf.c: 87: g=y-r;
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x30, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x2c, sp), x
	ldw	(0x2a, sp), y
;	../sincosf.c: 88: f=((r-XN*C1)+g)-XN*C2;
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x49
	push	#0x40
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x34, sp)
	pushw	x
	ldw	x, (0x34, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x28, sp), x
	ldw	x, (0x2c, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x24, sp), x
	ldw	(0x22, sp), y
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	push	#0x22
	push	#0xaa
	push	#0x7d
	push	#0x3a
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x28, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x0c, sp), x
	ldw	(0x0a, sp), y
;	../sincosf.c: 90: g=f*f;
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	../sincosf.c: 91: if(g>EPS2) //Used to be if(fabsf(f)>EPS)
	push	#0xf3
	push	#0xff
	push	#0x7f
	push	#0x33
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jrne	00152$
	jp	00114$
00152$:
;	../sincosf.c: 93: r=(((r4*g+r3)*g+r2)*g+r1)*g;
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	push	#0x5b
	push	#0x9c
	push	#0x2e
	push	#0x36
	call	___fsmul
	addw	sp, #8
	push	#0x22
	push	#0xb2
	push	#0x4f
	push	#0xb9
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x20, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	push	#0x3e
	push	#0x87
	push	#0x08
	push	#0x3c
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	push	#0xa4
	push	#0xaa
	push	#0x2a
	push	#0xbe
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x18, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
;	../sincosf.c: 94: f+=f*r;
	pushw	x
	pushw	y
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x0c, sp), x
	ldw	(0x0a, sp), y
00114$:
;	../sincosf.c: 96: return (sign?-f:f);
	tnz	(0x01, sp)
	jreq	00117$
	ldw	y, (0x0c, sp)
	ldw	x, (0x0a, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x14, sp), y
	ldw	(0x12, sp), x
	jra	00118$
00117$:
	ldw	y, (0x0c, sp)
	ldw	(0x14, sp), y
	ldw	y, (0x0a, sp)
	ldw	(0x12, sp), y
00118$:
	ldw	x, (0x14, sp)
	ldw	y, (0x12, sp)
00115$:
	addw	sp, #58
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
