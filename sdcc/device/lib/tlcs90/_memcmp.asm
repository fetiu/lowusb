;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:55 2022
;--------------------------------------------------------
	.module _memcmp
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcmp
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
;../_memcmp.c:31: int memcmp (const void * buf1, const void * buf2, size_t count)
;	---------------------------------
; Function memcmp
; ---------------------------------
_memcmp_start::
_memcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-2
;../_memcmp.c:33: if (!count)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00112$
;../_memcmp.c:34: return(0);
	ld	hl,#0x0000
	jp	00107$
;../_memcmp.c:36: while ( --count && *((char *)buf1) == *((char *)buf2) ) {
00112$:
	ex	de, hl
	ld	hl, 10 (sp)
	ex	de, hl
00104$:
	dec	de
	ld	a,d
	or	a,e
	jp	Z,00106$
	ld	iy, 6 (sp)
	ld	a, 0 (iy)
	ld	-1 (ix),a
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a,(bc)
	ld	-2 (ix),a
	ld	a,-1 (ix)
	sub	a, -2 (ix)
	jr	NZ,00106$
;../_memcmp.c:37: buf1 = (char *)buf1 + 1;
	inc	iy
	push	hl
	push	iy
	pop	hl
	ld	8 (sp), hl
	pop	hl
;../_memcmp.c:38: buf2 = (char *)buf2 + 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	8 (sp), hl
	jp	00104$
00106$:
;../_memcmp.c:41: return( *((unsigned char *)buf1) - *((unsigned char *)buf2) );
	ld	hl, 6 (sp)
	ld	e,(hl)
	ld	d,#0x00
	ld	hl, 8 (sp)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	l,a
	ld	a,d
	sbc	a, h
	ld	h,a
00107$:
	ld	sp, ix
	pop	ix
	ret
_memcmp_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
