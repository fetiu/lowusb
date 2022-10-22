;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:38:15 2022
;--------------------------------------------------------
	.module _atof
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atoi
	.globl _toupper
	.globl _isspace
	.globl _atof
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_atof_sloc0_1_0:
	.ds 4
_atof_sloc1_1_0:
	.ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_atof_sign_1_36:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_atof_s_1_35:
	.ds 3
_atof_value_1_36:
	.ds 4
_atof_fraction_1_36:
	.ds 4
_atof_iexp_1_36:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'atof'
;------------------------------------------------------------
;sloc0                     Allocated with name '_atof_sloc0_1_0'
;sloc1                     Allocated with name '_atof_sloc1_1_0'
;s                         Allocated with name '_atof_s_1_35'
;value                     Allocated with name '_atof_value_1_36'
;fraction                  Allocated with name '_atof_fraction_1_36'
;iexp                      Allocated with name '_atof_iexp_1_36'
;------------------------------------------------------------
;	_atof.c:33: float atof(const char * s)
;	-----------------------------------------
;	 function atof
;	-----------------------------------------
_atof:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_atof_s_1_35
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_atof.c:40: while (isspace(*s)) s++;
	mov	dptr,#_atof_s_1_35
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_isspace
	mov	r1,#(_isspace >> 8)
	mov	r2,#(_isspace >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	pop	ar5
	pop	ar6
	pop	ar7
	orl	a,b
	jz	00145$
	inc	r5
	cjne	r5,#0x00,00177$
	inc	r6
00177$:
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	sjmp	00101$
00145$:
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_atof.c:43: if (*s == '-')
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x2D,00107$
;	_atof.c:45: sign=1;
	setb	_atof_sign_1_36
;	_atof.c:46: s++;
	mov	dptr,#_atof_s_1_35
	mov	a,#0x01
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	sjmp	00108$
00107$:
;	_atof.c:50: sign=0;
	clr	_atof_sign_1_36
;	_atof.c:51: if (*s == '+') s++;
	cjne	r4,#0x2B,00108$
	mov	dptr,#_atof_s_1_35
	mov	a,#0x01
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
00108$:
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	mov	dptr,#_atof_value_1_36
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_atof_s_1_35
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00124$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_isdigit
	mov	r1,#(_isdigit >> 8)
	mov	r2,#(_isdigit >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	pop	ar5
	pop	ar6
	pop	ar7
	orl	a,b
	jnz	00182$
	ljmp	00146$
00182$:
;	_atof.c:57: value=10.0*value+(*s-'0');
	push	ar7
	push	ar6
	push	ar5
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	_atof_sloc0_1_0,dpl
	mov	(_atof_sloc0_1_0 + 1),dph
	mov	(_atof_sloc0_1_0 + 2),b
	mov	(_atof_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r0,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	a,r0
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r0
	add	a,#0xD0
	mov	r0,a
	mov	a,r4
	addc	a,#0xFF
	mov	r4,a
	mov	dpl,r0
	mov	dph,r4
	push	ar7
	push	ar6
	push	ar5
	lcall	___sint2fs
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	push	ar1
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,_atof_sloc0_1_0
	mov	dph,(_atof_sloc0_1_0 + 1)
	mov	b,(_atof_sloc0_1_0 + 2)
	mov	a,(_atof_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dptr,#_atof_value_1_36
	mov	a,r1
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00124$
00146$:
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_atof.c:61: if (*s == '.')
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x2E,00183$
	sjmp	00184$
00183$:
	ljmp	00112$
00184$:
;	_atof.c:63: s++;
	inc	r5
	cjne	r5,#0x00,00185$
	inc	r6
00185$:
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	mov	dptr,#_atof_fraction_1_36
	mov	a,#0xCD
	movx	@dptr,a
	dec	a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	a,#0x3D
	inc	dptr
	movx	@dptr,a
00127$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_isdigit
	mov	r1,#(_isdigit >> 8)
	mov	r2,#(_isdigit >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	pop	ar5
	pop	ar6
	pop	ar7
	orl	a,b
	jnz	00186$
	ljmp	00147$
00186$:
;	_atof.c:66: value+=(*s-'0')*fraction;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	a,r4
	add	a,#0xD0
	mov	_atof_sloc0_1_0,a
	mov	a,r3
	addc	a,#0xFF
	mov	(_atof_sloc0_1_0 + 1),a
	mov	dptr,#_atof_fraction_1_36
	movx	a,@dptr
	mov	_atof_sloc1_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_atof_sloc1_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_atof_sloc1_1_0 + 2),a
	inc	dptr
	movx	a,@dptr
	mov	(_atof_sloc1_1_0 + 3),a
	mov	dpl,_atof_sloc0_1_0
	mov	dph,(_atof_sloc0_1_0 + 1)
	push	ar7
	push	ar6
	push	ar5
	lcall	___sint2fs
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	push	_atof_sloc1_1_0
	push	(_atof_sloc1_1_0 + 1)
	push	(_atof_sloc1_1_0 + 2)
	push	(_atof_sloc1_1_0 + 3)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	mov	a,r4
	lcall	___fsmul
	mov	_atof_sloc0_1_0,dpl
	mov	(_atof_sloc0_1_0 + 1),dph
	mov	(_atof_sloc0_1_0 + 2),b
	mov	(_atof_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	_atof_sloc0_1_0
	push	(_atof_sloc0_1_0 + 1)
	push	(_atof_sloc0_1_0 + 2)
	push	(_atof_sloc0_1_0 + 3)
	mov	dpl,r0
	mov	dph,r2
	mov	b,r3
	mov	a,r4
	lcall	___fsadd
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dptr,#_atof_value_1_36
	mov	a,r1
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	_atof.c:67: fraction*=0.1;
	push	_atof_sloc1_1_0
	push	(_atof_sloc1_1_0 + 1)
	push	(_atof_sloc1_1_0 + 2)
	push	(_atof_sloc1_1_0 + 3)
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dptr,#_atof_fraction_1_36
	mov	a,r1
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00127$
00147$:
	mov	dptr,#_atof_s_1_35
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
00112$:
;	_atof.c:72: if (toupper(*s)=='E')
	mov	dptr,#_atof_s_1_35
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_toupper
	mov	r1,#(_toupper >> 8)
	mov	r2,#(_toupper >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r3,#0x45,00187$
	cjne	r4,#0x00,00187$
	sjmp	00188$
00187$:
	ljmp	00120$
00188$:
;	_atof.c:74: s++;
	mov	dptr,#_atof_s_1_35
	mov	a,#0x01
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_atof.c:75: iexp=(signed char)atoi(s);
	mov	dptr,#_atof_s_1_35
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_atoi
	mov	r1,#(_atoi >> 8)
	mov	r2,#(_atoi >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_atof_iexp_1_36
	mov	a,r6
	movx	@dptr,a
;	_atof.c:77: while(iexp!=0)
00116$:
	mov	dptr,#_atof_iexp_1_36
	movx	a,@dptr
	mov	r7,a
	jnz	00189$
	ljmp	00120$
00189$:
;	_atof.c:79: if(iexp<0)
	mov	a,r7
	jnb	acc.7,00114$
;	_atof.c:81: value*=0.1;
	push	ar7
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r6,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	mov	dptr,#_atof_value_1_36
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	_atof.c:82: iexp++;
	mov	dptr,#_atof_iexp_1_36
	mov	a,r7
	inc	a
	movx	@dptr,a
	sjmp	00116$
00114$:
;	_atof.c:86: value*=10.0;
	push	ar7
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r6,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	mov	dptr,#_atof_value_1_36
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	_atof.c:87: iexp--;
	mov	a,r7
	dec	a
	mov	dptr,#_atof_iexp_1_36
	movx	@dptr,a
	ljmp	00116$
00120$:
;	_atof.c:93: if(sign) value*=-1.0;
	jnb	_atof_sign_1_36,00122$
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_atof_value_1_36
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	cpl	acc.7
	inc	dptr
	movx	@dptr,a
00122$:
;	_atof.c:94: return (value);
	mov	dptr,#_atof_value_1_36
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
