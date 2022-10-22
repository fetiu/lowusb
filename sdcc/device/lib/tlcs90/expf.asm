;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:39 2022
;--------------------------------------------------------
	.module expf
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ldexpf
	.globl _expf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../expf.c:330: float expf(float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function expf
; ---------------------------------
_expf_start::
_expf:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-34
;../expf.c:336: if(x>=0.0)
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl, 44 (sp)
	push	hl
	ld	hl, 44 (sp)
	push	hl
	call	___fslt
	add	sp, #8
	ld	a,l
	or	a, a
	jr	NZ,00102$
;../expf.c:337: { y=x;  sign=0; }
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #38
	add	hl, sp
	ld	bc, #4
	ldir
	ld	-34 (ix),#0x00
	jr	00103$
00102$:
;../expf.c:339: { y=-x; sign=1; }
	ld	a,7 (ix)
	xor	a,#0x80
	ld	d,a
	ld	h,4 (ix)
	ld	l,5 (ix)
	ld	e,6 (ix)
	ld	-33 (ix),h
	ld	-32 (ix),l
	ld	-31 (ix),e
	ld	-30 (ix),d
	ld	-34 (ix),#0x01
00103$:
;../expf.c:341: if(y<EXPEPS) return 1.0;
	ld	hl,#0x33D6
	push	hl
	ld	hl,#0xBF95
	push	hl
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	call	___fslt
	add	sp, #8
	ld	-7 (ix), l
	ld	a, l
	or	a, a
	jr	Z,00105$
	ld	hl,#0x0000
	ld	de,#0x3F80
	jp	00118$
00105$:
;../expf.c:343: if(y>BIGX)
	ld	hl,#0x42B1
	push	hl
	ld	hl,#0x7218
	push	hl
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	call	___fsgt
	add	sp, #8
	ld	a,l
	or	a, a
	jr	Z,00110$
;../expf.c:345: if(sign)
	bit	0,-34 (ix)
	jr	Z,00107$
;../expf.c:347: errno=ERANGE;
	ld	hl,#_errno + 0
	ld	(hl), #0x22
	ld	hl,#_errno + 1
	ld	(hl), #0x00
;../expf.c:349: ;
	ld	hl,#0xFFFF
	ld	de,#0x7F7F
	jp	00118$
00107$:
;../expf.c:353: return 0.0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00118$
00110$:
;../expf.c:357: z=y*K1;
	ld	hl, 3 (sp)
	push	hl
	ld	hl, 3 (sp)
	push	hl
	ld	hl,#0x3FB8
	push	hl
	ld	hl,#0xAA3B
	push	hl
	call	___fsmul
	add	sp, #8
	ld	-26 (ix),d
	ld	-27 (ix),e
	ld	-28 (ix),h
	ld	-29 (ix),l
	ld	hl, #23
	add	hl, sp
	ex	de, hl
	ld	hl, #5
	add	hl, sp
	ld	bc, #4
	ldir
;../expf.c:358: n=z;
	ld	hl, 25 (sp)
	push	hl
	ld	hl, 25 (sp)
	push	hl
	call	___fs2sint
	add	sp, #4
	ld	-12 (ix),h
	ld	-13 (ix), l
	ld	-2 (ix), l
	ld	a,-12 (ix)
	ld	-1 (ix),a
;../expf.c:360: if(n<0) --n;
	bit	7, -1 (ix)
	jr	Z,00112$
	dec	32 (sp)
	ld	hl, 32 (sp)
00112$:
;../expf.c:361: if(z-n>=0.5) ++n;
	ld	hl, 32 (sp)
	push	hl
	call	___sint2fs
	add	sp, #2
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl, 30 (sp)
	push	hl
	ld	hl, 30 (sp)
	push	hl
	ld	hl, 29 (sp)
	push	hl
	ld	hl, 29 (sp)
	push	hl
	call	___fssub
	add	sp, #8
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl, 34 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	call	___fslt
	add	sp, #8
	ld	a,l
	or	a, a
	jr	NZ,00114$
	inc	-2 (ix)
	jr	NZ,00148$
	inc	-1 (ix)
00148$:
00114$:
;../expf.c:362: xn=n;
	ld	hl, 32 (sp)
	push	hl
	call	___sint2fs
	add	sp, #2
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	-15 (ix),e
	ld	-14 (ix),d
;../expf.c:363: g=((y-xn*C1))-xn*C2;
	ld	hl, 19 (sp)
	push	hl
	ld	hl, 19 (sp)
	push	hl
	ld	hl,#0x3F31
	push	hl
	ld	hl,#0x8000
	push	hl
	call	___fsmul
	add	sp, #8
	ex	de, hl
	push	hl
	push	de
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	call	___fssub
	add	sp, #8
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl, 19 (sp)
	push	hl
	ld	hl, 19 (sp)
	push	hl
	ld	hl,#0xB95E
	push	hl
	ld	hl,#0x8083
	push	hl
	call	___fsmul
	add	sp, #8
	ex	de, hl
	push	hl
	push	de
	ld	hl, 34 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	call	___fssub
	add	sp, #8
	ld	-18 (ix),d
	ld	-19 (ix),e
	ld	-20 (ix),h
	ld	-21 (ix),l
;../expf.c:364: z=g*g;
	ld	hl, 15 (sp)
	push	hl
	ld	hl, 15 (sp)
	push	hl
	ld	hl, 19 (sp)
	push	hl
	ld	hl, 19 (sp)
	push	hl
	call	___fsmul
	add	sp, #8
	ld	-29 (ix),l
	ld	-28 (ix),h
	ld	-27 (ix),e
	ld	-26 (ix),d
;../expf.c:365: r=P(z)*g;
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	ld	hl,#0x3B88
	push	hl
	ld	hl,#0x5308
	push	hl
	call	___fsmul
	add	sp, #8
	ld	c,l
	ld	b,h
	ld	hl,#0x3E80
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	add	sp, #8
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl, 15 (sp)
	push	hl
	ld	hl, 15 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	call	___fsmul
	add	sp, #8
	ld	-22 (ix),d
	ld	-23 (ix),e
	ld	-24 (ix),h
	ld	-25 (ix),l
	ld	hl, #28
	add	hl, sp
	ex	de, hl
	ld	hl, #9
	add	hl, sp
	ld	bc, #4
	ldir
;../expf.c:366: r=0.5+(r/(Q(z)-r));
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	ld	hl,#0x3D4C
	push	hl
	ld	hl,#0xBF5B
	push	hl
	call	___fsmul
	add	sp, #8
	ld	c,l
	ld	b,h
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	push	de
	push	bc
	call	___fsadd
	add	sp, #8
	ld	c,l
	ld	b,h
	ld	hl, 30 (sp)
	push	hl
	ld	hl, 30 (sp)
	push	hl
	push	de
	push	bc
	call	___fssub
	add	sp, #8
	ex	de, hl
	push	hl
	push	de
	ld	hl, 34 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	call	___fsdiv
	add	sp, #8
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl,#0x3F00
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl, 34 (sp)
	push	hl
	ld	hl, 34 (sp)
	push	hl
	call	___fsadd
	add	sp, #8
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl, #9
	add	hl, sp
	ex	de, hl
	ld	hl, #28
	add	hl, sp
	ld	bc, #4
	ldir
;../expf.c:368: n++;
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
;../expf.c:369: z=ldexpf(r, n);
	ld	hl, 21 (sp)
	push	hl
	ld	hl, 13 (sp)
	push	hl
	ld	hl, 13 (sp)
	push	hl
	call	_ldexpf
	add	sp, #6
	ld	-3 (ix),d
	ld	-4 (ix),e
	ld	-5 (ix),h
	ld	-6 (ix),l
;../expf.c:370: if(sign)
	bit	0,-34 (ix)
	jr	Z,00116$
;../expf.c:371: return 1.0/z;
	ld	hl, 30 (sp)
	push	hl
	ld	hl, 30 (sp)
	push	hl
	ld	hl,#0x3F80
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsdiv
	add	sp, #8
	ld	-8 (ix),d
	ld	-9 (ix),e
	ld	-10 (ix),h
	ld	-11 (ix), l
	ld	h,-10 (ix)
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	jr	00118$
00116$:
;../expf.c:373: return z;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,-4 (ix)
	ld	d,-3 (ix)
00118$:
	ld	sp, ix
	pop	ix
	ret
_expf_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
