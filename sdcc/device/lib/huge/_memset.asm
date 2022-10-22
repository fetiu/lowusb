;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:38:24 2022
;--------------------------------------------------------
	.module _memset
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset_PARM_3
	.globl _memset_PARM_2
	.globl _memset
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
	.area	OSEG    (OVR,DATA)
_memset_sloc0_1_0:
	.ds 2
_memset_sloc1_1_0:
	.ds 3
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
_memset_PARM_2:
	.ds 1
_memset_PARM_3:
	.ds 2
_memset_s_1_21:
	.ds 3
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
;Allocation info for local variables in function 'memset'
;------------------------------------------------------------
;c                         Allocated with name '_memset_PARM_2'
;n                         Allocated with name '_memset_PARM_3'
;s                         Allocated with name '_memset_s_1_21'
;ret                       Allocated with name '_memset_ret_1_22'
;sloc0                     Allocated with name '_memset_sloc0_1_0'
;sloc1                     Allocated with name '_memset_sloc1_1_0'
;------------------------------------------------------------
;	_memset.c:39: void *memset (void *s, unsigned char c, size_t n)
;	-----------------------------------------
;	 function memset
;	-----------------------------------------
_memset:
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
	mov	dptr,#_memset_s_1_21
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	_memset.c:44: register unsigned char *ret = s;
	mov	dptr,#_memset_s_1_21
	movx	a,@dptr
	mov	_memset_sloc1_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_memset_sloc1_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_memset_sloc1_1_0 + 2),a
	mov	r2,_memset_sloc1_1_0
	mov	r3,(_memset_sloc1_1_0 + 1)
	mov	r4,(_memset_sloc1_1_0 + 2)
;	_memset.c:46: while (n--)
	mov	dptr,#_memset_PARM_2
	movx	a,@dptr
	mov	r1,a
	mov	dptr,#_memset_PARM_3
	movx	a,@dptr
	mov	_memset_sloc0_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_memset_sloc0_1_0 + 1),a
00101$:
	mov	r0,_memset_sloc0_1_0
	mov	r7,(_memset_sloc0_1_0 + 1)
	dec	_memset_sloc0_1_0
	mov	a,#0xFF
	cjne	a,_memset_sloc0_1_0,00113$
	dec	(_memset_sloc0_1_0 + 1)
00113$:
	mov	a,r0
	orl	a,r7
	jz	00103$
;	_memset.c:48: *(unsigned char *) ret = c;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r1
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	_memset.c:49: ret = ((unsigned char *) ret) + 1;
	sjmp	00101$
00103$:
;	_memset.c:52: return s;
	mov	dpl,_memset_sloc1_1_0
	mov	dph,(_memset_sloc1_1_0 + 1)
	mov	b,(_memset_sloc1_1_0 + 2)
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
