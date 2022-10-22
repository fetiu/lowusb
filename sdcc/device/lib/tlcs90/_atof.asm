;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:29 2022
;--------------------------------------------------------
	.module _atof
	.optsdcc -mtlcs90
	
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
;../_atof.c:33: float atof(const char * s)
;	---------------------------------
; Function atof
; ---------------------------------
_atof_start::
_atof:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-17
;../_atof.c:40: while (isspace(*s)) s++;
	ld	hl, 21 (sp)
00101$:
	ld	a,(hl)
	ld	e,a
	rla
	sbc	a, a
	ld	d,a
	push	hl
	push	de
	call	_isspace
	add	sp, #2
	ld	-1 (ix),h
	ld	-2 (ix),l
	pop	hl
	ld	c, l
	ld	b, h
	inc	bc
	ld	a,-1 (ix)
	or	a,-2 (ix)
	jr	Z,00145$
	ld	l, c
	ld	h, b
	jr	00101$
00145$:
	ld	21 (sp), hl
;../_atof.c:43: if (*s == '-')
	ld	h,(hl)
	ld	a,h
	sub	a, #0x2D
	jr	NZ,00107$
;../_atof.c:45: sign=1;
	ld	-17 (ix),#0x01
;../_atof.c:46: s++;
	ld	4 (ix),c
	ld	5 (ix),b
	jr	00108$
00107$:
;../_atof.c:50: sign=0;
	ld	-17 (ix),#0x00
;../_atof.c:51: if (*s == '+') s++;
	ld	a,h
	sub	a, #0x2B
	jr	NZ,00108$
	ld	4 (ix),c
	ld	5 (ix),b
00108$:
;../_atof.c:55: for (value=0.0; isdigit(*s); s++)
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ex	de, hl
	ld	hl, 21 (sp)
	ex	de, hl
00124$:
	ld	a,(de)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	push	de
	push	hl
	call	_isdigit
	add	sp, #2
	ld	c,l
	ld	b,h
	pop	de
	ld	a,(de)
	ld	-2 (ix),a
	ld	hl,#0x0001
	add	hl,de
	ld	13 (sp), hl
	ld	a,b
	or	a,c
	jp	Z,00146$
;../_atof.c:57: value=10.0*value+(*s-'0');
	ld	hl, 7 (sp)
	push	hl
	ld	hl, 7 (sp)
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	add	sp, #8
	ld	c,l
	ld	b,h
	ld	l,-2 (ix)
	ld	a,-2 (ix)
	rla
	sbc	a, a
	ld	h,a
	ld	a,l
	add	a,#0xD0
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	push	bc
	push	de
	push	hl
	call	___sint2fs
	add	sp, #2
	ld	-5 (ix),d
	ld	-6 (ix),e
	ld	-7 (ix),h
	ld	-8 (ix),l
	pop	de
	pop	bc
	ld	hl, 11 (sp)
	push	hl
	ld	hl, 11 (sp)
	push	hl
	push	de
	push	bc
	call	___fsadd
	add	sp, #8
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_atof.c:55: for (value=0.0; isdigit(*s); s++)
	ex	de, hl
	ld	hl, 13 (sp)
	ex	de, hl
	jp	00124$
00146$:
	ld	4 (ix),e
	ld	5 (ix),d
;../_atof.c:61: if (*s == '.')
	ld	a,-2 (ix)
	sub	a, #0x2E
	jp	NZ,00112$
;../_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	ld	-16 (ix),#0xCD
	ld	-15 (ix),#0xCC
	ld	-14 (ix),#0xCC
	ld	-13 (ix),#0x3D
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
00127$:
	ld	hl, 9 (sp)
	ld	a,(hl)
	ld	-4 (ix), a
	ld	-4 (ix), a
	rla
	sbc	a, a
	ld	-3 (ix),a
	ld	hl, 13 (sp)
	push	hl
	call	_isdigit
	add	sp, #2
	ld	a,h
	or	a,l
	jp	Z,00147$
;../_atof.c:66: value+=(*s-'0')*fraction;
	ld	hl, 9 (sp)
	ld	a,(hl)
	ld	h,a
	rla
	sbc	a, a
	ld	l,a
	ld	a,h
	add	a,#0xD0
	ld	e,a
	ld	a,l
	adc	a,#0xFF
	ld	d,a
	push	de
	call	___sint2fs
	add	sp, #2
	ld	c,l
	ld	b,h
	ld	hl, 3 (sp)
	push	hl
	ld	hl, 3 (sp)
	push	hl
	push	de
	push	bc
	call	___fsmul
	add	sp, #8
	ex	de, hl
	push	hl
	push	de
	ld	hl, 11 (sp)
	push	hl
	ld	hl, 11 (sp)
	push	hl
	call	___fsadd
	add	sp, #8
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_atof.c:67: fraction*=0.1;
	ld	hl, 3 (sp)
	push	hl
	ld	hl, 3 (sp)
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	add	sp, #8
	ld	-16 (ix),l
	ld	-15 (ix),h
	ld	-14 (ix),e
	ld	-13 (ix),d
;../_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	inc	-8 (ix)
	jp	NZ,00127$
	inc	-7 (ix)
	jp	00127$
00147$:
	ld	a,-8 (ix)
	ld	4 (ix),a
	ld	a,-7 (ix)
	ld	5 (ix),a
00112$:
;../_atof.c:72: if (toupper(*s)=='E')
	ld	a,4 (ix)
	ld	-8 (ix),a
	ld	a,5 (ix)
	ld	-7 (ix),a
	ld	hl, 9 (sp)
	ld	a,(hl)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	push	hl
	call	_toupper
	add	sp, #2
	ld	a,l
	sub	a,#0x45
	jp	NZ,00120$
	or	a,h
	jp	NZ,00120$
;../_atof.c:74: s++;
	ld	a,-8 (ix)
	add	a, #0x01
	ld	4 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	5 (ix),a
;../_atof.c:75: iexp=(signed char)atoi(s);
	ld	hl, 21 (sp)
	push	hl
	call	_atoi
	add	sp, #2
	ld	b,l
;../_atof.c:77: while(iexp!=0)
00116$:
	ld	a,b
	or	a, a
	jp	Z,00120$
;../_atof.c:79: if(iexp<0)
	bit	7, b
	jr	Z,00114$
;../_atof.c:81: value*=0.1;
	push	bc
	ld	hl, 9 (sp)
	push	hl
	ld	hl, 9 (sp)
	push	hl
	ld	hl,#0x3DCC
	push	hl
	ld	hl,#0xCCCD
	push	hl
	call	___fsmul
	add	sp, #8
	pop	bc
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_atof.c:82: iexp++;
	inc	b
	jp	00116$
00114$:
;../_atof.c:86: value*=10.0;
	push	bc
	ld	hl, 9 (sp)
	push	hl
	ld	hl, 9 (sp)
	push	hl
	ld	hl,#0x4120
	push	hl
	ld	hl,#0x0000
	push	hl
	call	___fsmul
	add	sp, #8
	pop	bc
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
;../_atof.c:87: iexp--;
	dec	b
	jp	00116$
00120$:
;../_atof.c:93: if(sign) value*=-1.0;
	bit	0,-17 (ix)
	jr	Z,00122$
	ld	a,-9 (ix)
	xor	a,#0x80
	ld	-9 (ix),a
00122$:
;../_atof.c:94: return (value);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
_atof_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
