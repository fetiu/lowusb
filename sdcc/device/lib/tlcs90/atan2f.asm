;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:45 2022
;--------------------------------------------------------
	.module atan2f
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fabsf
	.globl _atanf
	.globl _atan2f
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
;../atan2f.c:34: float atan2f(float x, float y)
;	---------------------------------
; Function atan2f
; ---------------------------------
_atan2f_start::
_atan2f:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-12
;../atan2f.c:38: if ((x==0.0) && (y==0.0))
	ld	a,7 (ix)
	res	7, a
	or	a, 6 (ix)
	or	a, 5 (ix)
	or	a,4 (ix)
	jr	NZ,00102$
	ld	a,11 (ix)
	res	7, a
	or	a, 10 (ix)
	or	a, 9 (ix)
	or	a,8 (ix)
	jr	NZ,00102$
;../atan2f.c:40: errno=EDOM;
	ld	hl,#_errno + 0
	ld	(hl), #0x21
	ld	hl,#_errno + 1
	ld	(hl), #0x00
;../atan2f.c:41: return 0.0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00109$
00102$:
;../atan2f.c:44: if(fabsf(y)>=fabsf(x))
	ld	hl, 22 (sp)
	push	hl
	ld	hl, 22 (sp)
	push	hl
	call	_fabsf
	add	sp, #4
	ld	-1 (ix),d
	ld	-2 (ix),e
	ld	-3 (ix),h
	ld	-4 (ix),l
	ld	hl, 18 (sp)
	push	hl
	ld	hl, 18 (sp)
	push	hl
	call	_fabsf
	add	sp, #4
	ld	-5 (ix),d
	ld	-6 (ix),e
	ld	-7 (ix),h
	ld	-8 (ix),l
;../atan2f.c:47: if(y<0.0) r+=(x>=0?PI:-PI);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl, 22 (sp)
	push	hl
	ld	hl, 22 (sp)
	push	hl
;../atan2f.c:44: if(fabsf(y)>=fabsf(x))
	call	___fslt
	add	sp, #8
	ld	c,l
	push	bc
	ld	hl, 8 (sp)
	push	hl
	ld	hl, 8 (sp)
	push	hl
	ld	hl, 16 (sp)
	push	hl
	ld	hl, 16 (sp)
	push	hl
	call	___fslt
	add	sp, #8
	ld	a, l
	pop	bc
	ld	b,a
	or	a, a
	jp	NZ,00107$
;../atan2f.c:46: r=atanf(x/y);
	push	bc
	ld	hl, 24 (sp)
	push	hl
	ld	hl, 24 (sp)
	push	hl
	ld	hl, 24 (sp)
	push	hl
	ld	hl, 24 (sp)
	push	hl
	call	___fsdiv
	add	sp, #8
	push	de
	push	hl
	call	_atanf
	add	sp, #4
	pop	bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	-6 (ix),e
	ld	-5 (ix),d
;../atan2f.c:47: if(y<0.0) r+=(x>=0?PI:-PI);
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl, 28 (sp)
	push	hl
	ld	hl, 28 (sp)
	push	hl
	call	___fslt
	add	sp, #8
	ld	a,l
	pop	bc
	or	a, a
	jp	Z,00108$
	ld	a,c
	or	a, a
	jr	NZ,00111$
	ld	de,#0x0FDB
	ld	hl,#0x4049
	jr	00112$
00111$:
	ld	de,#0x0FDB
	ld	hl,#0xC049
00112$:
	push	hl
	push	de
	ld	hl, 10 (sp)
	push	hl
	ld	hl, 10 (sp)
	push	hl
	call	___fsadd
	add	sp, #8
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	-6 (ix),e
	ld	-5 (ix),d
	jp	00108$
00107$:
;../atan2f.c:51: r=-atanf(y/x);
	push	bc
	ld	hl, 20 (sp)
	push	hl
	ld	hl, 20 (sp)
	push	hl
	ld	hl, 28 (sp)
	push	hl
	ld	hl, 28 (sp)
	push	hl
	call	___fsdiv
	add	sp, #8
	push	de
	push	hl
	call	_atanf
	add	sp, #4
	pop	bc
	ld	a,d
	xor	a,#0x80
	ld	d,a
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
;../atan2f.c:52: r+=(x<0.0?-HALF_PI:HALF_PI);
	ld	a,c
	or	a, a
	jr	Z,00113$
	ld	bc,#0x0FDB
	ld	hl,#0xBFC9
	jr	00114$
00113$:
	ld	bc,#0x0FDB
	ld	hl,#0x3FC9
00114$:
	push	hl
	push	bc
	ld	hl, 6 (sp)
	push	hl
	ld	hl, 6 (sp)
	push	hl
	call	___fsadd
	add	sp, #8
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	-6 (ix),e
	ld	-5 (ix),d
00108$:
;../atan2f.c:54: return r;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,-6 (ix)
	ld	d,-5 (ix)
00109$:
	ld	sp, ix
	pop	ix
	ret
_atan2f_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
