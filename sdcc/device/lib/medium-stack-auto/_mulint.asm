;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:38:49 2022
;--------------------------------------------------------
	.module _mulint
	.optsdcc -mmcs51 --model-medium
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mulint
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
;Allocation info for local variables in function '_mulint'
;------------------------------------------------------------
;b                         Allocated to stack - _bp -4
;a                         Allocated to stack - _bp +1
;x                         Allocated to stack - _bp +3
;y                         Allocated to registers r5 r6 r7 
;t                         Allocated to stack - _bp +6
;------------------------------------------------------------
;	_mulint.c:226: _mulint (int a, int b)
;	-----------------------------------------
;	 function _mulint
;	-----------------------------------------
__mulint:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	push	_bp
	mov	_bp,sp
	push	dpl
	push	dph
	mov	a,sp
	add	a,#0x05
	mov	sp,a
;	_mulint.c:238: x = (union uu *)&a;
	mov	r7,_bp
	inc	r7
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
;	_mulint.c:239: y = (union uu *)&b;
	mov	a,_bp
	add	a,#0xFC
	mov	r5,a
	mov	r6,#0x00
	mov	r7,#0x40
;	_mulint.c:243: t.t = (unsigned char)a * (unsigned char)b;
	mov	a,_bp
	add	a,#0x06
	mov	r1,a
	mov	r0,_bp
	inc	r0
	mov	ar4,@r0
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	ar3,@r0
	mov	b,r4
	mov	a,r3
	mul	ab
	mov	@r1,a
	inc	r1
	mov	@r1,b
;	_mulint.c:244: t.s.hi += ((unsigned char)a * y->s.hi) + (x->s.hi * (unsigned char)b);
	mov	a,_bp
	add	a,#0x06
	inc	a
	mov	r1,a
	mov	ar4,@r1
	mov	r0,_bp
	inc	r0
	mov	ar3,@r0
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	b,r3
	mul	ab
	mov	r3,a
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	a,#0x01
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	ar7,@r0
	mov	b,r5
	mov	a,r7
	mul	ab
	add	a,r3
	add	a,r4
	mov	@r1,a
;	_mulint.c:246: return t.t;
	mov	a,_bp
	add	a,#0x06
	mov	r1,a
	mov	dpl,@r1
	inc	r1
	mov	dph,@r1
	mov	sp,_bp
	pop	_bp
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
