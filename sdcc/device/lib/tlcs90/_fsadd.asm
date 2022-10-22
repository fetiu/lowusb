;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:33 2022
;--------------------------------------------------------
	.module _fsadd
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsadd
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
;../_fsadd.c:170: float __fsadd (float a1, float a2)
;	---------------------------------
; Function __fsadd
; ---------------------------------
___fsadd_start::
___fsadd:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-37
;../_fsadd.c:178: pfl2 = (long _AUTOMEM *)&a2;
	ld	hl,#0x002D
	add	hl,sp
	ld	35 (sp), hl
	ld	a,-2 (ix)
	ld	-30 (ix),a
	ld	a,-1 (ix)
	ld	-29 (ix),a
;../_fsadd.c:179: exp2 = EXP (*pfl2);
	ex	de, hl
	ld	hl, 7 (sp)
	ex	de, hl
	ld	hl, #0x001F
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #27
	add	hl, sp
	ex	de, hl
	ld	hl, #31
	add	hl, sp
	ld	bc, #4
	ldir
	push	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,-8 (ix)
	ld	c,-7 (ix)
	pop	af
	ld	b,#0x17
00221$:
	srl	c
	rr	d
	rr	h
	rr	l
	djnz	00221$
	ld	h,#0x00
	ld	e,#0x00
	ld	-34 (ix),l
	ld	-33 (ix),h
;../_fsadd.c:180: mant2 = MANT (*pfl2) << 4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,-8 (ix)
	res	7, c
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	d,a
	push	af
	ld	-26 (ix),l
	ld	-25 (ix),h
	ld	-24 (ix),d
	ld	-23 (ix),b
	pop	af
	ld	a,#0x04
00223$:
	sla	-26 (ix)
	rl	-25 (ix)
	rl	-24 (ix)
	rl	-23 (ix)
	dec	a
	jr	NZ,00223$
;../_fsadd.c:181: if (SIGN (*pfl2))
	ld	a,-7 (ix)
	rlc	a
	and	a,#0x01
	jr	Z,00102$
;../_fsadd.c:182: mant2 = -mant2;
	xor	a, a
	sub	a, -26 (ix)
	ld	-26 (ix),a
	ld	a, #0x00
	sbc	a, -25 (ix)
	ld	-25 (ix),a
	ld	a, #0x00
	sbc	a, -24 (ix)
	ld	-24 (ix),a
	ld	a, #0x00
	sbc	a, -23 (ix)
	ld	-23 (ix),a
00102$:
;../_fsadd.c:184: if (!*pfl2)
	ld	a,-3 (ix)
	or	a, -4 (ix)
	or	a, -5 (ix)
	or	a,-6 (ix)
	jr	NZ,00104$
;../_fsadd.c:185: return (a1);
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	jp	00137$
00104$:
;../_fsadd.c:187: pfl1 = (long _AUTOMEM *)&a1;
	ld	hl,#0x0029
	add	hl,sp
	ld	27 (sp), hl
	ld	a,-10 (ix)
	ld	-28 (ix),a
	ld	a,-9 (ix)
	ld	-27 (ix),a
;../_fsadd.c:188: exp1 = EXP (*pfl1);
	ex	de, hl
	ld	hl, 9 (sp)
	ex	de, hl
	ld	hl, #0x001B
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, #31
	add	hl, sp
	ex	de, hl
	ld	hl, #27
	add	hl, sp
	ld	bc, #4
	ldir
	push	af
	ld	a,-6 (ix)
	ld	-14 (ix),a
	ld	a,-5 (ix)
	ld	-13 (ix),a
	ld	a,-4 (ix)
	ld	-12 (ix),a
	ld	a,-3 (ix)
	ld	-11 (ix),a
	pop	af
	ld	b,#0x17
00225$:
	srl	-11 (ix)
	rr	-12 (ix)
	rr	-13 (ix)
	rr	-14 (ix)
	djnz	00225$
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	a,-14 (ix)
	ld	-14 (ix),a
	ld	a,-13 (ix)
	ld	-13 (ix),a
;../_fsadd.c:189: mant1 = MANT (*pfl1) << 4;
	ld	a,-6 (ix)
	ld	-18 (ix),a
	ld	a,-5 (ix)
	ld	-17 (ix),a
	ld	a,-4 (ix)
	and	a, #0x7F
	ld	-16 (ix),a
	ld	-15 (ix),#0x00
	set	7, -16 (ix)
	ld	a, -16 (ix)
	push	af
	pop	af
	ld	b,#0x04
00227$:
	sla	-18 (ix)
	rl	-17 (ix)
	rl	-16 (ix)
	rl	-15 (ix)
	djnz	00227$
;../_fsadd.c:190: if (SIGN(*pfl1))
	ld	a,-3 (ix)
	rlc	a
	and	a,#0x01
	jr	Z,00108$
;../_fsadd.c:191: if (*pfl1 & 0x80000000)
	bit	7, -3 (ix)
	jr	Z,00108$
;../_fsadd.c:192: mant1 = -mant1;
	xor	a, a
	sub	a, -18 (ix)
	ld	-18 (ix),a
	ld	a, #0x00
	sbc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a, #0x00
	sbc	a, -16 (ix)
	ld	-16 (ix),a
	ld	a, #0x00
	sbc	a, -15 (ix)
	ld	-15 (ix),a
00108$:
;../_fsadd.c:194: if (!*pfl1)
	ld	a,-7 (ix)
	or	a, -8 (ix)
	or	a, -9 (ix)
	or	a,-10 (ix)
	jr	NZ,00110$
;../_fsadd.c:195: return (a2);
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	e,10 (ix)
	ld	d,11 (ix)
	jp	00137$
00110$:
;../_fsadd.c:197: expd = exp1 - exp2;
	ld	a,-14 (ix)
	sub	a, -34 (ix)
	ld	-10 (ix),a
	ld	a,-13 (ix)
	sbc	a, -33 (ix)
	ld	-9 (ix),a
;../_fsadd.c:198: if (expd > 25)
	ld	a,#0x19
	cp	a, -10 (ix)
	ld	a,#0x00
	sbc	a, -9 (ix)
	jp	PO, 00230$
	xor	a, #0x80
00230$:
	jp	P,00112$
;../_fsadd.c:199: return (a1);
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	jp	00137$
00112$:
;../_fsadd.c:200: if (expd < -25)
	ld	a,-10 (ix)
	sub	a, #0xE7
	ld	a,-9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00114$
;../_fsadd.c:201: return (a2);
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	e,10 (ix)
	ld	d,11 (ix)
	jp	00137$
00114$:
;../_fsadd.c:203: if (expd < 0)
	bit	7, -9 (ix)
	jp	Z,00116$
;../_fsadd.c:205: expd = -expd;
	xor	a, a
	sub	a, -10 (ix)
	ld	-6 (ix),a
	ld	a, #0x00
	sbc	a, -9 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	ld	-36 (ix),a
	ld	a,-5 (ix)
	ld	-35 (ix),a
;../_fsadd.c:206: exp1 += expd;
	ld	a,-14 (ix)
	add	a, -36 (ix)
	ld	-14 (ix),a
	ld	a,-13 (ix)
	adc	a, -35 (ix)
	ld	-13 (ix),a
;../_fsadd.c:207: mant1 >>= expd;
	ld	b,-36 (ix)
	push	af
	pop	af
	inc	b
	jr	00232$
00231$:
	sra	-15 (ix)
	rr	-16 (ix)
	rr	-17 (ix)
	rr	-18 (ix)
00232$:
	djnz	00231$
	jr	00117$
00116$:
;../_fsadd.c:211: mant2 >>= expd;
	ld	b,-10 (ix)
	push	af
	pop	af
	inc	b
	jr	00234$
00233$:
	sra	-23 (ix)
	rr	-24 (ix)
	rr	-25 (ix)
	rr	-26 (ix)
00234$:
	djnz	00233$
00117$:
;../_fsadd.c:213: mant1 += mant2;
	ld	a,-18 (ix)
	add	a, -26 (ix)
	ld	h,a
	ld	a,-17 (ix)
	adc	a, -25 (ix)
	ld	l,a
	ld	a,-16 (ix)
	adc	a, -24 (ix)
	ld	d,a
	ld	a,-15 (ix)
	adc	a, -23 (ix)
	ld	e,a
	ld	-22 (ix),h
	ld	-21 (ix),l
	ld	-20 (ix),d
	ld	-19 (ix),e
;../_fsadd.c:215: sign = false;
	ld	-37 (ix),#0x00
;../_fsadd.c:217: if (mant1 < 0)
	bit	7, -19 (ix)
	jr	Z,00121$
;../_fsadd.c:219: mant1 = -mant1;
	xor	a, a
	sub	a, -22 (ix)
	ld	-22 (ix),a
	ld	a, #0x00
	sbc	a, -21 (ix)
	ld	-21 (ix),a
	ld	a, #0x00
	sbc	a, -20 (ix)
	ld	-20 (ix),a
	ld	a, #0x00
	sbc	a, -19 (ix)
	ld	-19 (ix),a
;../_fsadd.c:220: sign = true;
	ld	-37 (ix),#0x01
	jr	00154$
00121$:
;../_fsadd.c:222: else if (!mant1)
	ld	a,-19 (ix)
	or	a, -20 (ix)
	or	a, -21 (ix)
	or	a,-22 (ix)
	jr	NZ,00154$
;../_fsadd.c:223: return (0);
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00137$
;../_fsadd.c:226: while (mant1 < (HIDDEN<<4)) {
00154$:
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
00123$:
	ld	hl, #23
	add	hl, sp
	ex	de, hl
	ld	hl, #15
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a,-11 (ix)
	sub	a, #0x08
	jr	NC,00157$
;../_fsadd.c:227: mant1 <<= 1;
	push	af
	pop	af
	ld	b,#0x01
	sla	-22 (ix)
	rl	-21 (ix)
	rl	-20 (ix)
	rl	-19 (ix)
;../_fsadd.c:228: exp1--;
	dec	19 (sp)
	ld	hl, 19 (sp)
	jr	00123$
;../_fsadd.c:232: while (mant1 & 0xf0000000) {
00157$:
	ld	a,-18 (ix)
	ld	-32 (ix),a
	ld	a,-17 (ix)
	ld	-31 (ix),a
00128$:
	ld	hl, #19
	add	hl, sp
	ex	de, hl
	ld	hl, #15
	add	hl, sp
	ld	bc, #4
	ldir
	ld	a,-15 (ix)
	and	a, #0xF0
	jp	Z,00163$
;../_fsadd.c:233: if (mant1&1)
	bit	0, -22 (ix)
	jr	Z,00127$
;../_fsadd.c:234: mant1 += 2;
	ld	a,-22 (ix)
	add	a, #0x02
	ld	-22 (ix),a
	ld	a,-21 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
	ld	a,-20 (ix)
	adc	a, #0x00
	ld	-20 (ix),a
	ld	a,-19 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
00127$:
;../_fsadd.c:235: mant1 >>= 1;
	push	af
	pop	af
	ld	b,#0x01
	sra	-19 (ix)
	rr	-20 (ix)
	rr	-21 (ix)
	rr	-22 (ix)
;../_fsadd.c:236: exp1++;
	inc	-32 (ix)
	jp	NZ,00128$
	inc	-31 (ix)
	jp	00128$
00163$:
	ld	a,-32 (ix)
	ld	-14 (ix),a
	ld	a,-31 (ix)
	ld	-13 (ix),a
;../_fsadd.c:240: mant1 &= ~(HIDDEN<<4);
	res	3, -15 (ix)
;../_fsadd.c:243: if (exp1 >= 0x100)
	ld	a,-31 (ix)
	xor	a, #0x80
	sub	a, #0x81
	jr	C,00135$
;../_fsadd.c:244: *pfl1 = (sign ? (SIGNBIT | __INFINITY) : __INFINITY);
	bit	0,-37 (ix)
	jr	Z,00139$
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x80
	ld	-7 (ix),#0xFF
	jr	00140$
00139$:
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x80
	ld	-7 (ix),#0x7F
00140$:
	ex	de, hl
	ld	hl, 9 (sp)
	ex	de, hl
	ld	hl, #0x001B
	add	hl, sp
	ld	bc, #0x0004
	ldir
	jp	00136$
00135$:
;../_fsadd.c:245: else if (exp1 < 0)
	bit	7, -31 (ix)
	jr	Z,00132$
;../_fsadd.c:246: *pfl1 = 0;
	ld	hl, 9 (sp)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00136$
00132$:
;../_fsadd.c:248: *pfl1 = PACK (sign ? SIGNBIT : 0 , exp1, mant1>>4);
	bit	0,-37 (ix)
	jr	Z,00141$
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x80
	jr	00142$
00141$:
	xor	a, a
	ld	-10 (ix),a
	ld	-9 (ix),a
	ld	-8 (ix),a
	ld	-7 (ix),a
00142$:
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,-13 (ix)
	rla
	sbc	a, a
	ld	e,a
	ld	d,a
	ld	b,#0x17
00242$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00242$
	ld	a,-10 (ix)
	or	a, l
	ld	-14 (ix),a
	ld	a,-9 (ix)
	or	a, h
	ld	-13 (ix),a
	ld	a,-8 (ix)
	or	a, e
	ld	-12 (ix),a
	ld	a,-7 (ix)
	or	a, d
	ld	-11 (ix),a
	push	af
	ld	e,-18 (ix)
	ld	d,-17 (ix)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	pop	af
	ld	b,#0x04
00244$:
	sra	h
	rr	l
	rr	d
	rr	e
	djnz	00244$
	ld	a,-14 (ix)
	or	a, e
	ld	e,a
	ld	a,-13 (ix)
	or	a, d
	ld	d,a
	ld	a,-12 (ix)
	or	a, l
	ld	c,a
	ld	a,-11 (ix)
	or	a, h
	ld	b,a
	ld	hl, 9 (sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00136$:
;../_fsadd.c:249: return (a1);
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
00137$:
	ld	sp, ix
	pop	ix
	ret
___fsadd_end::
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
