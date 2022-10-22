;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:38:30 2022
;--------------------------------------------------------
	.module _atof
	.optsdcc -mmcs51 --model-small
	
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
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
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
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
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
;s                         Allocated to registers r5 r3 r2 
;value                     Allocated to stack - _bp +8
;fraction                  Allocated to stack - _bp +12
;iexp                      Allocated to registers r6 
;sign                      Allocated to registers b0 
;sloc0                     Allocated to stack - _bp +1
;sloc1                     Allocated to stack - _bp +4
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
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x0F
	mov	sp,a
	mov	r5,dpl
	mov	r3,dph
	mov	r2,b
;	_atof.c:40: while (isspace(*s)) s++;
	mov	r0,_bp
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar2
00101$:
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	lcall	_isspace
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	00145$
	mov	r0,_bp
	inc	r0
	inc	@r0
	cjne	@r0,#0x00,00177$
	inc	r0
	inc	@r0
00177$:
	sjmp	00101$
00145$:
	mov	r0,_bp
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar2,@r0
;	_atof.c:43: if (*s == '-')
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x2D,00107$
;	_atof.c:45: sign=1;
	setb	b0
;	_atof.c:46: s++;
	mov	r0,_bp
	inc	r0
	mov	a,#0x01
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
	sjmp	00108$
00107$:
;	_atof.c:50: sign=0;
	clr	b0
;	_atof.c:51: if (*s == '+') s++;
	cjne	r4,#0x2B,00108$
	mov	r0,_bp
	inc	r0
	mov	a,#0x01
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
00108$:
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	mov	r0,_bp
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar2
00124$:
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	push	bits
	lcall	_isdigit
	mov	a,dpl
	mov	b,dph
	pop	bits
	orl	a,b
	jnz	00182$
	ljmp	00146$
00182$:
;	_atof.c:57: value=10.0*value+(*s-'0');
	push	bits
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	xch	a,r0
	mov	a,_bp
	add	a,#0x04
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	dec	r0
	dec	r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	a,r6
	add	a,#0xD0
	mov	dpl,a
	mov	a,r5
	addc	a,#0xFF
	mov	dph,a
	push	bits
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	pop	bits
	push	bits
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsadd
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	_atof.c:55: for (value=0.0; isdigit(*s); s++)
	ljmp	00124$
00146$:
	mov	r0,_bp
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar2,@r0
;	_atof.c:61: if (*s == '.')
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x2E,00183$
	sjmp	00184$
00183$:
	ljmp	00112$
00184$:
;	_atof.c:63: s++;
	mov	r0,_bp
	inc	r0
	mov	a,#0x01
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	mov	a,_bp
	add	a,#0x0c
	mov	r0,a
	mov	@r0,#0xCD
	inc	r0
	mov	@r0,#0xCC
	inc	r0
	mov	@r0,#0xCC
	inc	r0
	mov	@r0,#0x3D
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar2
00127$:
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	dpl,r6
	mov	dph,r5
	push	bits
	lcall	_isdigit
	mov	a,dpl
	mov	b,dph
	pop	bits
	orl	a,b
	jnz	00185$
	ljmp	00147$
00185$:
;	_atof.c:66: value+=(*s-'0')*fraction;
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	dec	r0
	dec	r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	a,r6
	add	a,#0xD0
	mov	dpl,a
	mov	a,r5
	addc	a,#0xFF
	mov	dph,a
	push	bits
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	pop	bits
	push	bits
	mov	a,_bp
	add	a,#0x0c
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	push	bits
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsadd
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	_atof.c:67: fraction*=0.1;
	push	bits
	mov	a,_bp
	add	a,#0x0c
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	mov	a,_bp
	add	a,#0x0c
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	_atof.c:64: for (fraction=0.1; isdigit(*s); s++)
	ljmp	00127$
00147$:
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar2,@r0
00112$:
;	_atof.c:72: if (toupper(*s)=='E')
	mov	dpl,r5
	mov	dph,r3
	mov	b,r2
	lcall	__gptrget
	mov	r7,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
	push	ar5
	push	ar3
	push	ar2
	push	bits
	lcall	_toupper
	mov	r6,dpl
	mov	r7,dph
	pop	bits
	pop	ar2
	pop	ar3
	pop	ar5
	cjne	r6,#0x45,00186$
	cjne	r7,#0x00,00186$
	sjmp	00187$
00186$:
	ljmp	00120$
00187$:
;	_atof.c:74: s++;
	inc	r5
	cjne	r5,#0x00,00188$
	inc	r3
00188$:
;	_atof.c:75: iexp=(signed char)atoi(s);
	mov	dpl,r5
	mov	dph,r3
	mov	b,r2
	push	bits
	lcall	_atoi
	mov	r6,dpl
	mov	r7,dph
	pop	bits
;	_atof.c:77: while(iexp!=0)
00116$:
	mov	a,r6
	jnz	00189$
	ljmp	00120$
00189$:
;	_atof.c:79: if(iexp<0)
	mov	a,r6
	jnb	acc.7,00114$
;	_atof.c:81: value*=0.1;
	push	ar6
	push	bits
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#0xCCCD
	mov	b,#0xCC
	mov	a,#0x3D
	lcall	___fsmul
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	pop	ar6
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar7
;	_atof.c:82: iexp++;
	inc	r6
	sjmp	00116$
00114$:
;	_atof.c:86: value*=10.0;
	push	ar6
	push	bits
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	bits
	pop	ar6
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar7
;	_atof.c:87: iexp--;
	dec	r6
	ljmp	00116$
00120$:
;	_atof.c:93: if(sign) value*=-1.0;
	jnb	b0,00122$
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	cpl	acc.7
	mov	@r0,a
00122$:
;	_atof.c:94: return (value);
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	mov	sp,_bp
	pop	_bp
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
