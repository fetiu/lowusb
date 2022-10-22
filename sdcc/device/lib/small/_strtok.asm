;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:37:44 2022
;--------------------------------------------------------
	.module _strtok
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strchr
	.globl _strtok_PARM_2
	.globl _strtok
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
_strtok_s_1_22:
	.ds 3
_strtok_PARM_2:
	.ds 3
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
;Allocation info for local variables in function 'strtok'
;------------------------------------------------------------
;s                         Allocated with name '_strtok_s_1_22'
;control                   Allocated with name '_strtok_PARM_2'
;str                       Allocated to registers r5 r6 r7 
;s1                        Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	_strtok.c:36: char * strtok ( char * str, const char * control )
;	-----------------------------------------
;	 function strtok
;	-----------------------------------------
_strtok:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	_strtok.c:41: if ( str )
	mov	a,r5
	orl	a,r6
	jz	00102$
;	_strtok.c:42: s = str;
	mov	_strtok_s_1_22,r5
	mov	(_strtok_s_1_22 + 1),r6
	mov	(_strtok_s_1_22 + 2),r7
00102$:
;	_strtok.c:43: if ( !s )
	mov	a,_strtok_s_1_22
	orl	a,(_strtok_s_1_22 + 1)
;	_strtok.c:44: return NULL;
	jnz	00108$
	mov	dptr,#0x0000
	mov	b,a
	ret
;	_strtok.c:46: while (*s) {
00108$:
	mov	r5,_strtok_s_1_22
	mov	r6,(_strtok_s_1_22 + 1)
	mov	r7,(_strtok_s_1_22 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00110$
;	_strtok.c:47: if (strchr(control,*s))
	mov	r5,_strtok_s_1_22
	mov	r6,(_strtok_s_1_22 + 1)
	mov	r7,(_strtok_s_1_22 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	_strchr_PARM_2,a
	mov	dpl,_strtok_PARM_2
	mov	dph,(_strtok_PARM_2 + 1)
	mov	b,(_strtok_PARM_2 + 2)
	lcall	_strchr
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jz	00110$
;	_strtok.c:48: s++;
	inc	_strtok_s_1_22
	clr	a
;	_strtok.c:50: break;
	cjne	a,_strtok_s_1_22,00108$
	inc	(_strtok_s_1_22 + 1)
	sjmp	00108$
00110$:
;	_strtok.c:53: s1 = s;
	mov	r5,_strtok_s_1_22
	mov	r6,(_strtok_s_1_22 + 1)
	mov	r7,(_strtok_s_1_22 + 2)
;	_strtok.c:55: while (*s) {
00113$:
	mov	r2,_strtok_s_1_22
	mov	r3,(_strtok_s_1_22 + 1)
	mov	r4,(_strtok_s_1_22 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jz	00115$
;	_strtok.c:56: if (strchr(control,*s)) {
	mov	r2,_strtok_s_1_22
	mov	r3,(_strtok_s_1_22 + 1)
	mov	r4,(_strtok_s_1_22 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	_strchr_PARM_2,a
	mov	dpl,_strtok_PARM_2
	mov	dph,(_strtok_PARM_2 + 1)
	mov	b,(_strtok_PARM_2 + 2)
	push	ar7
	push	ar6
	push	ar5
	lcall	_strchr
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,r2
	orl	a,r3
	jz	00112$
;	_strtok.c:57: *s++ = '\0';
	mov	r2,_strtok_s_1_22
	mov	r3,(_strtok_s_1_22 + 1)
	mov	r4,(_strtok_s_1_22 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	_strtok_s_1_22
;	genFromRTrack removed	clr	a
	cjne	a,_strtok_s_1_22,00155$
	inc	(_strtok_s_1_22 + 1)
00155$:
;	_strtok.c:58: return s1;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	ret
00112$:
;	_strtok.c:60: s++ ;
	inc	_strtok_s_1_22
	clr	a
	cjne	a,_strtok_s_1_22,00113$
	inc	(_strtok_s_1_22 + 1)
	sjmp	00113$
00115$:
;	_strtok.c:63: s = NULL;
	clr	a
	mov	_strtok_s_1_22,a
	mov	(_strtok_s_1_22 + 1),a
;	1-genFromRTrack replaced	mov	(_strtok_s_1_22 + 2),#0x00
	mov	(_strtok_s_1_22 + 2),a
;	_strtok.c:65: if (*s1)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00117$
;	_strtok.c:66: return s1;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	ret
00117$:
;	_strtok.c:68: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
