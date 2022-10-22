;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:38:08 2022
;--------------------------------------------------------
	.module isalpha
	.optsdcc -mmcs51 --model-large
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isalpha
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
_isalpha_c_1_20:
	.ds 2
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
;Allocation info for local variables in function 'isalpha'
;------------------------------------------------------------
;c                         Allocated with name '_isalpha_c_1_20'
;__00010004                Allocated with name '_isalpha___00010004_4_27'
;__00010001                Allocated with name '_isalpha___00010001_4_24'
;__00020002                Allocated with name '_isalpha___00020002_3_23'
;c                         Allocated with name '_isalpha_c_3_23'
;__00020005                Allocated with name '_isalpha___00020005_3_26'
;c                         Allocated with name '_isalpha_c_3_26'
;------------------------------------------------------------
;	isalpha.c:37: int isalpha (int c)
;	-----------------------------------------
;	 function isalpha
;	-----------------------------------------
_isalpha:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_isalpha_c_1_20
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	isalpha.c:39: return (isupper (c) || islower (c));
	mov	dptr,#_isalpha_c_1_20
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
;	../../device/include/ctype.h:65: return (c >= 'A' && c <= 'Z');
	clr	c
	mov	a,r6
	subb	a,#0x41
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00110$
	mov	a,#0x5A
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00106$
00110$:
;	../../device/include/ctype.h:60: return (c >= 'a' && c <= 'z');
	clr	c
	mov	a,r6
	subb	a,#0x61
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00113$
	mov	a,#0x7A
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00106$
00113$:
;	isalpha.c:39: return (isupper (c) || islower (c));
	mov	r7,#0x00
	sjmp	00107$
00106$:
	mov	r7,#0x01
00107$:
	mov	a,r7
	rlc	a
	subb	a,acc
	mov	dpl,r7
	mov	dph,a
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
