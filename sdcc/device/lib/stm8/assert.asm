;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:41:12 2022
;--------------------------------------------------------
	.module assert
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __assert
	.globl _printf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../assert.c: 32: void _assert(char *expr, const char *filename, unsigned int linenumber)
;	-----------------------------------------
;	 function _assert
;	-----------------------------------------
__assert:
;	../assert.c: 34: printf("Assert(%s) failed at line %u in file %s.\n",
	ldw	y, #___str_0+0
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	pushw	y
	call	_printf
	addw	sp, #8
;	../assert.c: 36: while(1);
00102$:
	jra	00102$
	ret
	.area CODE
___str_0:
	.ascii "Assert(%s) failed at line %u in file %s."
	.db 0x0A
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
