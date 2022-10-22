;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:37:49 2022
;--------------------------------------------------------
	.module _atof
	.optsdcc -mmcs51 --model-medium
	
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
	.ds 3
_atof_sloc1_1_0:
	.ds 2
_atof_sloc2_1_0:
	.ds 4
_atof_sloc3_1_0:
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
_atof_s_1_35:
	.ds 3
_atof_value_1_36:
	.ds 4
_atof_fraction_1_36:
	.ds 4
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
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
;sloc2                     Allocated with name '_atof_sloc2_1_0'
;sloc3                     Allocated with name '_atof_sloc3_1_0'
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
	mov	r0,#_atof_s_1_35
	movx	@r0,a
	inc	r0
	mov	a,r6
	movx	@r0,a
	inc	r0
	mov	a,r7
	movx	@r0,a
;	_atof.c:40: while (isspace(*s)) s++;
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	mov	r2,a
	inc	r0
	movx	a,@r0
	mov	r3,a
	inc	r0
	movx	a,@r0
	mov	r4,a
00101$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r0,a
	rlc	a
	subb	a,acc
	mov	r1,a
	mov	dpl,r0
	mov	dph,r1
	push	ar4
	push	ar3
	push	ar2
	lcall	_isspace
	mov	a,dpl
	mov	b,dph
	pop	ar2
	pop	ar3
	pop	ar4
	orl	a,b
	jz	00145$
	inc	r2
	cjne	r2,#0x00,00101$
	inc	r3
	sjmp	00101$
00145$:
	mov	r0,#_atof_s_1_35
	mov	a,r2
	movx	@r0,a
	inc	r0
	mov	a,r3
	movx	@r0,a
	inc	r0
	mov	a,r4
	movx	@r0,a
;	_atof.c:43: if (*s == '-')
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x2D,00107$
;	_atof.c:45: sign=1;
	setb	_atof_sign_1_36
;	_atof.c:46: s++;
	mov	r0,#_atof_s_1_35
	mov	a,#0x01
	add	a,r2
	movx	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	movx	@r0,a
	inc	r0
	mov	a,r4
	movx	@r0,a
	sjmp	00108$
00107$:
;	_atof.c:50: sign=0;
	clr	_atof_sign_1_36
;	_atof.c:51: if (*s == '+') s++;
	cjne	r1,#0x2B,00108$
	mov	r0,#_atof_s_1_35
	mov	a,#0x01
	add	a,r2
	movx	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	movx	@r0,a
	inc	r0
	mov	a,r4
	movx	@r0,a
00108$:
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	mov	r0,#_atof_value_1_36
	clr	a
	movx	@r0,a
	inc	r0
	movx	@r0,a
	inc	r0
	movx	@r0,a
	inc	r0
	movx	@r0,a
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	mov	_atof_sloc0_1_0,a
	inc	r0
	movx	a,@r0
	mov	(_atof_sloc0_1_0 + 1),a
	inc	r0
	movx	a,@r0
	mov	(_atof_sloc0_1_0 + 2),a
00124$:
	mov	dpl,_atof_sloc0_1_0
	mov	dph,(_atof_sloc0_1_0 + 1)
	mov	b,(_atof_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	mov	_atof_sloc1_1_0,r2
	rlc	a
	subb	a,acc
	mov	(_atof_sloc1_1_0 + 1),a
	mov	dpl,_atof_sloc1_1_0
	mov	dph,(_atof_sloc1_1_0 + 1)
	lcall	_isdigit
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00182$
	ljmp	00146$
00182$:
;	_atof.c:57: value=10.0*value+(*s-'0');
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	_atof_sloc2_1_0,dpl
	mov	(_atof_sloc2_1_0 + 1),dph
	mov	(_atof_sloc2_1_0 + 2),b
	mov	(_atof_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_atof_sloc0_1_0
	mov	dph,(_atof_sloc0_1_0 + 1)
	mov	b,(_atof_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	mov	_atof_sloc0_1_0,dpl
	mov	(_atof_sloc0_1_0 + 1),dph
	mov	a,r2
	mov	_atof_sloc1_1_0,a
	rlc	a
	subb	a,acc
	mov	(_atof_sloc1_1_0 + 1),a
	mov	a,_atof_sloc1_1_0
	add	a,#0xD0
	mov	dpl,a
	mov	a,(_atof_sloc1_1_0 + 1)
	addc	a,#0xFF
	mov	dph,a
	lcall	___sint2fs
	mov	_atof_sloc3_1_0,dpl
	mov	(_atof_sloc3_1_0 + 1),dph
	mov	(_atof_sloc3_1_0 + 2),b
	mov	(_atof_sloc3_1_0 + 3),a
	push	_atof_sloc3_1_0
	push	(_atof_sloc3_1_0 + 1)
	push	(_atof_sloc3_1_0 + 2)
	push	(_atof_sloc3_1_0 + 3)
	mov	dpl,_atof_sloc2_1_0
	mov	dph,(_atof_sloc2_1_0 + 1)
	mov	b,(_atof_sloc2_1_0 + 2)
	mov	a,(_atof_sloc2_1_0 + 3)
	lcall	___fsadd
	mov	r0,#_atof_value_1_36
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	ljmp	00124$
00146$:
	mov	r0,#_atof_s_1_35
	mov	a,_atof_sloc0_1_0
	movx	@r0,a
	inc	r0
	mov	a,(_atof_sloc0_1_0 + 1)
	movx	@r0,a
	inc	r0
	mov	a,(_atof_sloc0_1_0 + 2)
	movx	@r0,a
;	_atof.c:61: if (*s == '.')
	mov	dpl,_atof_sloc0_1_0
	mov	dph,(_atof_sloc0_1_0 + 1)
	mov	b,(_atof_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	cjne	r2,#0x2E,00183$
	sjmp	00184$
00183$:
	ljmp	00112$
00184$:
;	_atof.c:63: s++;
	mov	r0,#_atof_s_1_35
	mov	a,#0x01
	add	a,_atof_sloc0_1_0
	movx	@r0,a
	clr	a
	addc	a,(_atof_sloc0_1_0 + 1)
	inc	r0
	movx	@r0,a
	inc	r0
	mov	a,(_atof_sloc0_1_0 + 2)
	movx	@r0,a
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	mov	r0,#_atof_fraction_1_36
	mov	a,#0xCD
	movx	@r0,a
	inc	r0
	dec	a
	movx	@r0,a
	inc	r0
	movx	@r0,a
	inc	r0
	mov	a,#0x3D
	movx	@r0,a
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	mov	_atof_sloc3_1_0,a
	inc	r0
	movx	a,@r0
	mov	(_atof_sloc3_1_0 + 1),a
	inc	r0
	movx	a,@r0
	mov	(_atof_sloc3_1_0 + 2),a
00127$:
	mov	dpl,_atof_sloc3_1_0
	mov	dph,(_atof_sloc3_1_0 + 1)
	mov	b,(_atof_sloc3_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	dpl,r2
	mov	dph,r7
	lcall	_isdigit
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00185$
	ljmp	00147$
00185$:
;	_atof.c:66: value+=(*s-'0')*fraction;
	mov	dpl,_atof_sloc3_1_0
	mov	dph,(_atof_sloc3_1_0 + 1)
	mov	b,(_atof_sloc3_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	mov	_atof_sloc3_1_0,dpl
	mov	(_atof_sloc3_1_0 + 1),dph
	mov	a,r2
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,r2
	add	a,#0xD0
	mov	dpl,a
	mov	a,r7
	addc	a,#0xFF
	mov	dph,a
	lcall	___sint2fs
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	r0,#_atof_fraction_1_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	mov	dpl,r2
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsmul
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar5
	push	ar6
	push	ar7
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	lcall	___fsadd
	mov	r0,#_atof_value_1_36
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	_atof.c:67: fraction*=0.1;
	mov	r0,#_atof_fraction_1_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r0,#_atof_fraction_1_36
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	ljmp	00127$
00147$:
	mov	r0,#_atof_s_1_35
	mov	a,_atof_sloc3_1_0
	movx	@r0,a
	inc	r0
	mov	a,(_atof_sloc3_1_0 + 1)
	movx	@r0,a
	inc	r0
	mov	a,(_atof_sloc3_1_0 + 2)
	movx	@r0,a
00112$:
;	_atof.c:72: if (toupper(*s)=='E')
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	lcall	__gptrget
	mov	r7,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
	lcall	_toupper
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x45,00186$
	cjne	r7,#0x00,00186$
	sjmp	00187$
00186$:
	ljmp	00120$
00187$:
;	_atof.c:74: s++;
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	add	a,#0x01
	movx	@r0,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	movx	@r0,a
;	_atof.c:75: iexp=(signed char)atoi(s);
	mov	r0,#_atof_s_1_35
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	lcall	_atoi
	mov	r6,dpl
	mov	r7,dph
;	_atof.c:77: while(iexp!=0)
00116$:
	mov	a,r6
	jnz	00188$
	ljmp	00120$
00188$:
;	_atof.c:79: if(iexp<0)
	mov	a,r6
	jnb	acc.7,00114$
;	_atof.c:81: value*=0.1;
	push	ar6
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r0,#_atof_value_1_36
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar6
;	_atof.c:82: iexp++;
	inc	r6
	sjmp	00116$
00114$:
;	_atof.c:86: value*=10.0;
	push	ar6
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	inc	r0
	movx	a,@r0
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	r0,#_atof_value_1_36
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar6
;	_atof.c:87: iexp--;
	dec	r6
	ljmp	00116$
00120$:
;	_atof.c:93: if(sign) value*=-1.0;
	jnb	_atof_sign_1_36,00122$
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	movx	@r0,a
	inc	r0
	movx	a,@r0
	movx	@r0,a
	inc	r0
	movx	a,@r0
	movx	@r0,a
	inc	r0
	movx	a,@r0
	cpl	acc.7
	movx	@r0,a
00122$:
;	_atof.c:94: return (value);
	mov	r0,#_atof_value_1_36
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
