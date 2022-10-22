;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:40:32 2022
;--------------------------------------------------------
	.module expf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
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
;	../expf.c: 330: float expf(float x) _FLOAT_FUNC_REENTRANT
;	-----------------------------------------
;	 function expf
;	-----------------------------------------
_expf:
	sub	sp, #44
;	../expf.c: 336: if(x>=0.0)
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x35, sp)
	pushw	x
	ldw	x, (0x35, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jrne	00102$
;	../expf.c: 337: { y=x;  sign=0; }
	ldw	y, (0x31, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x2f, sp)
	ldw	(0x02, sp), y
	clr	(0x01, sp)
	jra	00103$
00102$:
;	../expf.c: 339: { y=-x; sign=1; }
	ldw	y, (0x31, sp)
	ldw	x, (0x2f, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ld	a, #0x01
	ld	(0x01, sp), a
00103$:
;	../expf.c: 341: if(y<EXPEPS) return 1.0;
	push	#0x95
	push	#0xbf
	push	#0xd6
	push	#0x33
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	ld	(0x2c, sp), a
	tnz	(0x2c, sp)
	jreq	00105$
	clrw	x
	ldw	y, #0x3f80
	jp	00118$
00105$:
;	../expf.c: 343: if(y>BIGX)
	push	#0x18
	push	#0x72
	push	#0xb1
	push	#0x42
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00110$
;	../expf.c: 345: if(sign)
	tnz	(0x01, sp)
	jreq	00107$
;	../expf.c: 347: errno=ERANGE;
	ldw	x, #0x0022
	ldw	_errno+0, x
;	../expf.c: 349: ;
	ldw	x, #0xffff
	ldw	y, #0x7f7f
	jp	00118$
00107$:
;	../expf.c: 353: return 0.0;
	clrw	x
	clrw	y
	jp	00118$
00110$:
;	../expf.c: 357: z=y*K1;
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	push	#0x3b
	push	#0xaa
	push	#0xb8
	push	#0x3f
	call	___fsmul
	addw	sp, #8
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
	ldw	y, (0x08, sp)
	ldw	(0x2a, sp), y
	ldw	y, (0x06, sp)
	ldw	(0x28, sp), y
;	../expf.c: 358: n=z;
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, (0x2a, sp)
	pushw	x
	call	___fs2sint
	addw	sp, #4
	ldw	(0x26, sp), x
;	../expf.c: 360: if(n<0) --n;
	tnz	(0x26, sp)
	jrpl	00112$
	ldw	x, (0x26, sp)
	decw	x
	ldw	(0x26, sp), x
00112$:
;	../expf.c: 361: if(z-n>=0.5) ++n;
	ldw	x, (0x26, sp)
	pushw	x
	call	___sint2fs
	addw	sp, #2
	pushw	x
	pushw	y
	ldw	x, (0x2e, sp)
	pushw	x
	ldw	x, (0x2e, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x3f
	pushw	x
	pushw	y
	call	___fslt
	addw	sp, #8
	tnz	a
	jrne	00114$
	ldw	x, (0x26, sp)
	incw	x
	ldw	(0x26, sp), x
00114$:
;	../expf.c: 362: xn=n;
	ldw	x, (0x26, sp)
	pushw	x
	call	___sint2fs
	addw	sp, #2
	ldw	(0x14, sp), x
	ldw	(0x12, sp), y
;	../expf.c: 363: g=((y-xn*C1))-xn*C2;
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	push	#0x00
	push	#0x80
	push	#0x31
	push	#0x3f
	call	___fsmul
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x24, sp), x
	ldw	(0x22, sp), y
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	push	#0x83
	push	#0x80
	push	#0x5e
	push	#0xb9
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
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
;	../expf.c: 364: z=g*g;
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsmul
	addw	sp, #8
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	../expf.c: 365: r=P(z)*g;
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	push	#0x08
	push	#0x53
	push	#0x88
	push	#0x3b
	call	___fsmul
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x3e
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x20, sp), x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	pushw	y
	call	___fsmul
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	(0x1a, sp), y
;	../expf.c: 366: r=0.5+(r/(Q(z)-r));
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	push	#0x5b
	push	#0xbf
	push	#0x4c
	push	#0x3d
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
	ldw	(0x18, sp), x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1c, sp)
	pushw	x
	pushw	y
	call	___fssub
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	___fsdiv
	addw	sp, #8
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x3f
	pushw	x
	pushw	y
	call	___fsadd
	addw	sp, #8
	ldw	(0x0c, sp), x
;	../expf.c: 368: n++;
	ldw	x, (0x26, sp)
	incw	x
;	../expf.c: 369: z=ldexpf(r, n);
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	pushw	y
	call	_ldexpf
	addw	sp, #6
;	../expf.c: 370: if(sign)
	tnz	(0x01, sp)
	jreq	00116$
;	../expf.c: 371: return 1.0/z;
	pushw	x
	pushw	y
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	call	___fsdiv
	addw	sp, #8
;	../expf.c: 373: return z;
00116$:
00118$:
	addw	sp, #44
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
