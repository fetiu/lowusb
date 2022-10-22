;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:39:55 2022
;--------------------------------------------------------
	.module _strstr
	.optsdcc -mtlcs90
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strstr
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
;../_strstr.c:31: char * strstr ( const char * str1, const char * str2 )
;	---------------------------------
; Function strstr
; ---------------------------------
_strstr_start::
_strstr:
	push	ix
	ld	ix,#0
	add	ix,sp
	add	sp, #-14
;../_strstr.c:33: const char * cp = str1;
	ld	a,4 (ix)
	ld	-10 (ix),a
	ld	a,5 (ix)
	ld	-9 (ix),a
;../_strstr.c:37: if ( !*str2 )
	ld	a,6 (ix)
	ld	-14 (ix),a
	ld	a,7 (ix)
	ld	-13 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-1 (ix), a
	or	a, a
	jr	NZ,00122$
;../_strstr.c:38: return str1;
	ld	hl, 4 (sp)
	jp	00113$
;../_strstr.c:40: while (*cp)
00122$:
	ld	a,-10 (ix)
	ld	-12 (ix),a
	ld	a,-9 (ix)
	ld	-11 (ix),a
00110$:
	ld	hl, 2 (sp)
	ld	a,(hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z,00112$
;../_strstr.c:43: s2 = str2;
	ld	a,-14 (ix)
	ld	-3 (ix),a
	ld	a,-13 (ix)
	ld	-2 (ix),a
;../_strstr.c:45: while ( *s1 && *s2 && !(*s1-*s2) )
	ld	a,-12 (ix)
	ld	-5 (ix),a
	ld	a,-11 (ix)
	ld	-4 (ix),a
00105$:
	ld	hl, 9 (sp)
	ld	a,(hl)
	ld	-1 (ix),a
	ld	hl, 11 (sp)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00107$
	ld	a,-6 (ix)
	or	a, a
	jp	Z,00107$
	ld	a,-1 (ix)
	ld	-8 (ix),a
	ld	a,-1 (ix)
	rla
	sbc	a, a
	ld	-7 (ix),a
	ld	l,-6 (ix)
	ld	a,-6 (ix)
	rla
	sbc	a, a
	ld	h,a
	ld	a,-8 (ix)
	sub	a, l
	ld	l,a
	ld	a,-7 (ix)
	sbc	a, h
	or	a,l
	jr	NZ,00107$
;../_strstr.c:46: s1++, s2++;
	inc	-5 (ix)
	jr	NZ,00148$
	inc	-4 (ix)
00148$:
	inc	-3 (ix)
	jp	NZ,00105$
	inc	-2 (ix)
	jp	00105$
00107$:
;../_strstr.c:48: if (!*s2)
	ld	a,-6 (ix)
	or	a, a
	jr	NZ,00109$
;../_strstr.c:49: return( (char*)cp );
	ld	hl, 4 (sp)
	jr	00113$
00109$:
;../_strstr.c:51: cp++;
	inc	-12 (ix)
	jr	NZ,00150$
	inc	-11 (ix)
00150$:
	ld	a,-12 (ix)
	ld	-10 (ix),a
	ld	a,-11 (ix)
	ld	-9 (ix),a
	jp	00110$
00112$:
;../_strstr.c:54: return (NULL) ;
	ld	hl,#0x0000
00113$:
	ld	sp, ix
	pop	ix
	ret
_strstr_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
