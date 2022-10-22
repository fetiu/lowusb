;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:51 2022
;--------------------------------------------------------
	.module _mullonglong
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mullonglong
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
;../_mullonglong.c:35: long long _mullonglong(long long ll, long long lr)
;	---------------------------------
; Function _mullonglong
; ---------------------------------
__mullonglong_start::
__mullonglong:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-28
;../_mullonglong.c:37: unsigned long long ret = 0ull;
	xor	a, a
	ld	-22 (ix),a
	ld	-21 (ix),a
	ld	-20 (ix),a
	ld	-19 (ix),a
	ld	-18 (ix),a
	ld	-17 (ix),a
	ld	-16 (ix),a
	ld	-15 (ix),a
;../_mullonglong.c:38: unsigned char *l = (unsigned char *)(&ll);
	ld	hl,#0x0022
	add	hl,sp
	ld	4 (sp), hl
;../_mullonglong.c:39: unsigned char *r = (unsigned char *)(&lr);
	ld	hl,#0x002A
	add	hl,sp
	ld	2 (sp), hl
;../_mullonglong.c:42: for (i = 0; i < sizeof (long long); i++)
	ld	-27 (ix),#0x00
;../_mullonglong.c:44: for(j = 0; (i + j) < sizeof (long long); j++)
00111$:
	ld	a,-24 (ix)
	add	a, -27 (ix)
	ld	-2 (ix),a
	ld	a,-23 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	-28 (ix),#0x00
00104$:
	ld	a,-27 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-28 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-4 (ix)
	add	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,-3 (ix)
	adc	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	sub	a, #0x08
	ld	a,-5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC,00107$
;../_mullonglong.c:45: ret += ((unsigned short)(l[i] * r [j])) << ((i + j) * 8);
	ld	hl, 26 (sp)
	ld	e,(hl)
	ld	iy, 2 (sp)
	ld	c,-28 (ix)
	ld	b,#0x00
	add	iy, bc
	ld	h, 0 (iy)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00128$:
	add	hl,hl
	jr	NC,00129$
	add	hl,de
00129$:
	djnz	00128$
	ex	de,hl
	ld	hl, 22 (sp)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,l
	ex	de,hl
	inc	a
	jr	00131$
00130$:
	add	hl, hl
00131$:
	dec	a
	jr	NZ,00130$
	ld	-14 (ix),l
	ld	-13 (ix),h
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
	ld	a,-22 (ix)
	add	a, -14 (ix)
	ld	-22 (ix),a
	ld	a,-21 (ix)
	adc	a, -13 (ix)
	ld	-21 (ix),a
	ld	a,-20 (ix)
	adc	a, -12 (ix)
	ld	-20 (ix),a
	ld	a,-19 (ix)
	adc	a, -11 (ix)
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a, -10 (ix)
	ld	-18 (ix),a
	ld	a,-17 (ix)
	adc	a, -9 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, -8 (ix)
	ld	-16 (ix),a
	ld	a,-15 (ix)
	adc	a, -7 (ix)
	ld	-15 (ix),a
;../_mullonglong.c:44: for(j = 0; (i + j) < sizeof (long long); j++)
	inc	-28 (ix)
	jp	00104$
00107$:
;../_mullonglong.c:42: for (i = 0; i < sizeof (long long); i++)
	inc	-27 (ix)
	ld	a,-27 (ix)
	sub	a, #0x08
	jp	C,00111$
;../_mullonglong.c:48: return(ret);
	ld	hl, #32
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #6
	add	hl, sp
	ld	bc, #8
	ldir
	ld	sp, ix
	pop	ix
	ret
__mullonglong_end::
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
