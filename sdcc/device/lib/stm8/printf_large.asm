;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9092 (Oct 23 2022) (Mac OS X x86_64)
; This file was generated Sun Oct 23 01:41:12 2022
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strlen
	.globl __print_format
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
;	../printf_large.c: 116: output_digit (unsigned char n, bool lower_case, pfn_outputchar output_char, void* p)
;	-----------------------------------------
;	 function output_digit
;	-----------------------------------------
_output_digit:
;	../printf_large.c: 118: register unsigned char c = n + (unsigned char)'0';
	ld	a, (0x03, sp)
	add	a, #0x30
;	../printf_large.c: 120: if (c > (unsigned char)'9')
	cp	a, #0x39
	jrule	00104$
;	../printf_large.c: 122: c += (unsigned char)('A' - '0' - 10);
	add	a, #0x07
;	../printf_large.c: 123: if (lower_case)
	tnz	(0x04, sp)
	jreq	00104$
;	../printf_large.c: 124: c += (unsigned char)('a' - 'A');
	add	a, #0x20
00104$:
;	../printf_large.c: 126: output_char( c, p );
	ldw	x, (0x07, sp)
	pushw	x
	push	a
	ldw	x, (0x08, sp)
	call	(x)
	addw	sp, #3
	ret
;	../printf_large.c: 149: output_2digits (unsigned char b, bool lower_case, pfn_outputchar output_char, void* p)
;	-----------------------------------------
;	 function output_2digits
;	-----------------------------------------
_output_2digits:
;	../printf_large.c: 151: output_digit( b>>4,   lower_case, output_char, p );
	ld	a, (0x03, sp)
	swap	a
	and	a, #0x0f
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	exg	a, xl
	ld	a, (0x08, sp)
	exg	a, xl
	pushw	x
	addw	sp, #1
	push	a
	call	_output_digit
	addw	sp, #6
;	../printf_large.c: 152: output_digit( b&0x0F, lower_case, output_char, p );
	ld	a, (0x03, sp)
	and	a, #0x0f
	ld	yh, a
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	ld	a, (0x08, sp)
	push	a
	ld	a, yh
	push	a
	call	_output_digit
	addw	sp, #6
	ret
;	../printf_large.c: 168: calculate_digit (value_t _AUTOMEM * value, unsigned char radix)
;	-----------------------------------------
;	 function calculate_digit
;	-----------------------------------------
_calculate_digit:
	sub	sp, #9
;	../printf_large.c: 170: unsigned long ul = value->ul;
	ldw	y, (0x0c, sp)
	ldw	(0x08, sp), y
	ldw	x, (0x08, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	ldw	(0x04, sp), x
	ld	yh, a
;	../printf_large.c: 171: unsigned char _AUTOMEM * pb4 = &value->byte[4];
	ldw	x, (0x08, sp)
	addw	x, #0x0004
	ldw	(0x02, sp), x
;	../printf_large.c: 172: unsigned char i = 32;
	ld	a, #0x20
	ld	(0x01, sp), a
;	../printf_large.c: 174: do
00103$:
;	../printf_large.c: 176: *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
	ldw	x, (0x02, sp)
	ld	a, (x)
	sll	a
	ld	xh, a
	ld	a, (0x04, sp)
	sll	a
	clr	a
	rlc	a
	pushw	x
	or	a, (1, sp)
	popw	x
	ldw	x, (0x02, sp)
	ld	(x), a
;	../printf_large.c: 177: ul <<= 1;
	ldw	x, (0x04, sp)
	sllw	y
	rlcw	x
	ldw	(0x04, sp), x
;	../printf_large.c: 179: if (radix <= *pb4 )
	ldw	x, (0x02, sp)
	ld	a, (x)
	cp	a, (0x0e, sp)
	jrc	00104$
;	../printf_large.c: 181: *pb4 -= radix;
	sub	a, (0x0e, sp)
	ldw	x, (0x02, sp)
	ld	(x), a
;	../printf_large.c: 182: ul |= 1;
	srlw	y
	scf
	rlcw	y
	ld	a, (0x05, sp)
	ld	xl, a
	ld	a, (0x04, sp)
	ld	xh, a
	ldw	(0x04, sp), x
00104$:
;	../printf_large.c: 184: } while (--i);
	ld	a, (0x01, sp)
	dec	a
	ld	(0x01, sp), a
	tnz	a
	jrne	00103$
;	../printf_large.c: 185: value->ul = ul;
	ldw	x, (0x08, sp)
	ldw	(0x2, x), y
	ldw	y, (0x04, sp)
	ldw	(x), y
	addw	sp, #9
	ret
;	../printf_large.c: 434: _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	-----------------------------------------
;	 function _print_format
;	-----------------------------------------
__print_format:
	sub	sp, #136
;	../printf_large.c: 466: charsOutputted = 0;
	clrw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 475: while( c=*format++ )
	ldw	x, sp
	addw	x, #11
	ldw	(0x85, sp), x
	ldw	x, #___str_0+0
	ldw	(0x83, sp), x
	ldw	x, sp
	addw	x, #6
	ldw	(0x81, sp), x
	ldw	x, sp
	addw	x, #11
	ldw	(0x7f, sp), x
	ldw	x, (0x7f, sp)
	addw	x, #0x0004
	ldw	(0x7d, sp), x
00231$:
	ldw	x, (0x8f, sp)
	ld	a, (x)
	incw	x
	ldw	(0x8f, sp), x
	ld	xh, a
	tnz	a
	jrne	00550$
	jp	00233$
00550$:
;	../printf_large.c: 477: if ( c=='%' )
	ld	a, xh
	cp	a, #0x25
	jreq	00553$
	jp	00229$
00553$:
;	../printf_large.c: 479: left_justify    = 0;
	clr	(0x18, sp)
;	../printf_large.c: 480: zero_padding    = 0;
	clr	(0x17, sp)
;	../printf_large.c: 481: prefix_sign     = 0;
	clr	(0x16, sp)
;	../printf_large.c: 482: prefix_space    = 0;
	clr	(0x15, sp)
;	../printf_large.c: 483: signed_argument = 0;
	clr	(0x14, sp)
;	../printf_large.c: 484: char_argument   = 0;
	clr	(0x13, sp)
;	../printf_large.c: 485: long_argument   = 0;
	clr	(0x12, sp)
;	../printf_large.c: 486: float_argument  = 0;
	clr	(0x11, sp)
;	../printf_large.c: 487: radix           = 0;
	clr	(0x09, sp)
;	../printf_large.c: 488: width           = 0;
	clr	(0x7c, sp)
;	../printf_large.c: 489: decimals        = -1;
	ld	a, #0xff
	ld	(0x08, sp), a
;	../printf_large.c: 491: get_conversion_spec:
	ldw	y, (0x8f, sp)
	ldw	(0x7a, sp), y
00101$:
;	../printf_large.c: 493: c = *format++;
	ldw	x, (0x7a, sp)
	ld	a, (x)
	ldw	x, (0x7a, sp)
	incw	x
	ldw	(0x7a, sp), x
	ldw	y, (0x7a, sp)
	ldw	(0x8f, sp), y
	ld	(0x79, sp), a
;	../printf_large.c: 495: if (c=='%')
	ld	a, (0x79, sp)
	cp	a, #0x25
	jrne	00103$
;	../printf_large.c: 497: OUTPUT_CHAR(c, p);
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x7b, sp)
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 498: continue;
	jra	00231$
00103$:
;	../printf_large.c: 501: if (isdigit(c))
	ld	a, (0x79, sp)
	cp	a, #0x30
	jrc	00110$
	cp	a, #0x39
	jrugt	00110$
;	../printf_large.c: 503: if (decimals==-1)
	ld	a, (0x08, sp)
	cp	a, #0xff
	jrne	00107$
;	../printf_large.c: 505: width = 10*width + c - '0';
	ld	a, (0x7c, sp)
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, xl
	add	a, (0x79, sp)
	sub	a, #0x30
	ld	(0x7c, sp), a
;	../printf_large.c: 506: if (width == 0)
	tnz	(0x7c, sp)
	jrne	00101$
;	../printf_large.c: 509: zero_padding = 1;
	ld	a, #0x01
	ld	(0x17, sp), a
	jra	00101$
00107$:
;	../printf_large.c: 514: decimals = 10*decimals + c - '0';
	ld	a, (0x08, sp)
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, xl
	add	a, (0x79, sp)
	sub	a, #0x30
	ld	(0x08, sp), a
;	../printf_large.c: 516: goto get_conversion_spec;
	jra	00101$
00110$:
;	../printf_large.c: 519: if (c=='.')
	ld	a, (0x79, sp)
	cp	a, #0x2e
	jrne	00115$
;	../printf_large.c: 521: if (decimals==-1)
	ld	a, (0x08, sp)
	cp	a, #0xff
	jrne	00101$
;	../printf_large.c: 522: decimals=0;
	clr	(0x08, sp)
;	../printf_large.c: 525: goto get_conversion_spec;
	jra	00101$
00115$:
;	../printf_large.c: 528: if (islower(c))
	ld	a, (0x79, sp)
	cp	a, #0x61
	jrc	00117$
	cp	a, #0x7a
	jrugt	00117$
;	../printf_large.c: 530: c = toupper(c);
	ld	a, (0x79, sp)
	and	a, #0xdf
	ld	(0x79, sp), a
;	../printf_large.c: 531: lower_case = 1;
	ld	a, #0x01
	ld	(0x10, sp), a
	jra	00118$
00117$:
;	../printf_large.c: 534: lower_case = 0;
	clr	(0x10, sp)
00118$:
;	../printf_large.c: 536: switch( c )
	ld	a, (0x79, sp)
	cp	a, #0x20
	jrne	00572$
	jp	00122$
00572$:
	ld	a, (0x79, sp)
	cp	a, #0x2b
	jrne	00575$
	jp	00121$
00575$:
	ld	a, (0x79, sp)
	cp	a, #0x2d
	jrne	00578$
	jp	00120$
00578$:
	ld	a, (0x79, sp)
	cp	a, #0x42
	jrne	00581$
	jp	00123$
00581$:
	ld	a, (0x79, sp)
	cp	a, #0x43
	jrne	00584$
	jp	00129$
00584$:
	ld	a, (0x79, sp)
	cp	a, #0x44
	jrne	00587$
	jp	00154$
00587$:
	ld	a, (0x79, sp)
	cp	a, #0x46
	jrne	00590$
	jp	00158$
00590$:
	ld	a, (0x79, sp)
	cp	a, #0x48
	jrne	00593$
	jp	00101$
00593$:
	ld	a, (0x79, sp)
	cp	a, #0x49
	jrne	00596$
	jp	00154$
00596$:
	ld	a, (0x79, sp)
	cp	a, #0x4a
	jrne	00599$
	jp	00101$
00599$:
	ld	a, (0x79, sp)
	cp	a, #0x4c
	jreq	00128$
	ld	a, (0x79, sp)
	cp	a, #0x4f
	jrne	00605$
	jp	00155$
00605$:
	ld	a, (0x79, sp)
	cp	a, #0x50
	jrne	00608$
	jp	00152$
00608$:
	ld	a, (0x79, sp)
	cp	a, #0x53
	jreq	00133$
	ld	a, (0x79, sp)
	cp	a, #0x54
	jrne	00614$
	jp	00101$
00614$:
	ld	a, (0x79, sp)
	cp	a, #0x55
	jrne	00617$
	jp	00156$
00617$:
	ld	a, (0x79, sp)
	cp	a, #0x58
	jrne	00620$
	jp	00157$
00620$:
	ld	a, (0x79, sp)
	cp	a, #0x5a
	jrne	00623$
	jp	00101$
00623$:
	jp	00159$
;	../printf_large.c: 538: case '-':
00120$:
;	../printf_large.c: 539: left_justify = 1;
	ld	a, #0x01
	ld	(0x18, sp), a
;	../printf_large.c: 540: goto get_conversion_spec;
	jp	00101$
;	../printf_large.c: 541: case '+':
00121$:
;	../printf_large.c: 542: prefix_sign = 1;
	ld	a, #0x01
	ld	(0x16, sp), a
;	../printf_large.c: 543: goto get_conversion_spec;
	jp	00101$
;	../printf_large.c: 544: case ' ':
00122$:
;	../printf_large.c: 545: prefix_space = 1;
	ld	a, #0x01
	ld	(0x15, sp), a
;	../printf_large.c: 546: goto get_conversion_spec;
	jp	00101$
;	../printf_large.c: 547: case 'B': /* byte */
00123$:
;	../printf_large.c: 548: char_argument = 1;
	ld	a, #0x01
	ld	(0x13, sp), a
;	../printf_large.c: 549: goto get_conversion_spec;
	jp	00101$
;	../printf_large.c: 556: case 'L': /* long */
00128$:
;	../printf_large.c: 557: long_argument = 1;
	ld	a, #0x01
	ld	(0x12, sp), a
;	../printf_large.c: 558: goto get_conversion_spec;
	jp	00101$
;	../printf_large.c: 560: case 'C':
00129$:
;	../printf_large.c: 561: if( char_argument )
	tnz	(0x13, sp)
	jreq	00131$
;	../printf_large.c: 562: c = va_arg(ap,char);
	ldw	x, (0x91, sp)
	incw	x
	ldw	(0x91, sp), x
	decw	x
	ld	a, (x)
	jra	00132$
00131$:
;	../printf_large.c: 564: c = va_arg(ap,int);
	ldw	x, (0x91, sp)
	incw	x
	incw	x
	ldw	(0x91, sp), x
	decw	x
	decw	x
	ldw	x, (x)
	ld	a, xl
00132$:
;	../printf_large.c: 565: OUTPUT_CHAR( c, p );
	ldw	x, (0x8d, sp)
	pushw	x
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 566: break;
	jp	00160$
;	../printf_large.c: 568: case 'S':
00133$:
;	../printf_large.c: 569: PTR = va_arg(ap,ptr_t);
	ldw	x, sp
	addw	x, #11
	ldw	(0x77, sp), x
	ldw	x, (0x91, sp)
	incw	x
	incw	x
	ldw	(0x91, sp), x
	decw	x
	decw	x
	ldw	x, (x)
	ldw	y, (0x77, sp)
	ldw	(y), x
;	../printf_large.c: 582: length = strlen(PTR);
	pushw	x
	call	_strlen
	addw	sp, #2
	ld	a, xl
	ld	(0x76, sp), a
;	../printf_large.c: 584: if ( decimals == -1 )
	ld	a, (0x08, sp)
	cp	a, #0xff
	jrne	00135$
;	../printf_large.c: 586: decimals = length;
	ld	a, (0x76, sp)
	ld	(0x08, sp), a
00135$:
;	../printf_large.c: 588: if ( ( !left_justify ) && (length < width) )
	tnz	(0x18, sp)
	jrne	00277$
	ld	a, (0x76, sp)
	cp	a, (0x7c, sp)
	jrnc	00277$
;	../printf_large.c: 590: width -= length;
	ld	a, (0x7c, sp)
	sub	a, (0x76, sp)
;	../printf_large.c: 591: while( width-- != 0 )
	ldw	y, (0x87, sp)
	ldw	(0x74, sp), y
00136$:
	ld	xl, a
	dec	a
	exg	a, xl
	tnz	a
	exg	a, xl
	jreq	00312$
;	../printf_large.c: 593: OUTPUT_CHAR( ' ', p );
	push	a
	ldw	x, (0x8e, sp)
	pushw	x
	push	#0x20
	ldw	x, (0x8f, sp)
	call	(x)
	addw	sp, #3
	pop	a
	ldw	x, (0x74, sp)
	incw	x
	ldw	(0x74, sp), x
	jra	00136$
;	../printf_large.c: 597: while ( (c = *PTR)  && (decimals-- > 0))
00312$:
	ldw	y, (0x74, sp)
	ldw	(0x87, sp), y
	ld	(0x7c, sp), a
00277$:
	ld	a, (0x08, sp)
	ld	(0x73, sp), a
	ldw	y, (0x87, sp)
	ldw	(0x71, sp), y
00143$:
	ldw	x, (0x77, sp)
	ldw	x, (x)
	ld	a, (x)
	ld	(0x70, sp), a
	tnz	a
	jreq	00313$
	ld	a, (0x73, sp)
	dec	(0x73, sp)
	cp	a, #0x00
	jrsle	00313$
;	../printf_large.c: 599: OUTPUT_CHAR( c, p );
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x72, sp)
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x71, sp)
	incw	x
	ldw	(0x71, sp), x
;	../printf_large.c: 600: PTR++;
	ldw	x, (0x77, sp)
	ldw	x, (x)
	incw	x
	ldw	y, (0x77, sp)
	ldw	(y), x
	jra	00143$
00313$:
	ldw	y, (0x71, sp)
	ldw	(0x87, sp), y
;	../printf_large.c: 603: if ( left_justify && (length < width))
	tnz	(0x18, sp)
	jrne	00634$
	jp	00160$
00634$:
	ld	a, (0x76, sp)
	cp	a, (0x7c, sp)
	jrc	00635$
	jp	00160$
00635$:
;	../printf_large.c: 605: width -= length;
	ld	a, (0x7c, sp)
	sub	a, (0x76, sp)
;	../printf_large.c: 606: while( width-- != 0 )
	ldw	x, (0x71, sp)
00146$:
	ld	(0x6f, sp), a
	dec	a
	tnz	(0x6f, sp)
	jrne	00636$
	jp	00314$
00636$:
;	../printf_large.c: 608: OUTPUT_CHAR( ' ', p );
	push	a
	pushw	x
	ldw	y, (0x90, sp)
	pushw	y
	push	#0x20
	ldw	x, (0x91, sp)
	call	(x)
	addw	sp, #3
	popw	x
	pop	a
	incw	x
	jra	00146$
;	../printf_large.c: 613: case 'P':
00152$:
;	../printf_large.c: 614: PTR = va_arg(ap,ptr_t);
	ldw	x, sp
	addw	x, #11
	ldw	y, (0x91, sp)
	addw	y, #0x0002
	ldw	(0x91, sp), y
	subw	y, #0x0002
	ldw	y, (y)
	ldw	(x), y
;	../printf_large.c: 658: OUTPUT_CHAR('0', p);
	ldw	x, (0x8d, sp)
	pushw	x
	push	#0x30
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
;	../printf_large.c: 659: OUTPUT_CHAR('x', p);
	pushw	x
	ldw	y, (0x8f, sp)
	pushw	y
	push	#0x78
	ldw	x, (0x90, sp)
	call	(x)
	addw	sp, #3
	popw	x
	incw	x
	ldw	(0x6d, sp), x
;	../printf_large.c: 660: OUTPUT_2DIGITS( value.byte[1] );
	ldw	x, sp
	addw	x, #12
	ld	a, (x)
	ld	yh, a
	ldw	x, (0x8d, sp)
	pushw	x
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x14, sp)
	push	a
	ld	a, yh
	push	a
	call	_output_2digits
	addw	sp, #6
	ldw	x, (0x6d, sp)
	incw	x
	incw	x
	ldw	(0x6b, sp), x
;	../printf_large.c: 661: OUTPUT_2DIGITS( value.byte[0] );
	ldw	x, (0x85, sp)
	ld	a, (x)
	ld	yh, a
	ldw	x, (0x8d, sp)
	pushw	x
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x14, sp)
	push	a
	ld	a, yh
	push	a
	call	_output_2digits
	addw	sp, #6
	ldw	x, (0x6b, sp)
	incw	x
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 663: break;
	jra	00160$
;	../printf_large.c: 666: case 'I':
00154$:
;	../printf_large.c: 667: signed_argument = 1;
	ld	a, #0x01
	ld	(0x14, sp), a
;	../printf_large.c: 668: radix = 10;
	ld	a, #0x0a
	ld	(0x09, sp), a
;	../printf_large.c: 669: break;
	jra	00160$
;	../printf_large.c: 671: case 'O':
00155$:
;	../printf_large.c: 672: radix = 8;
	ld	a, #0x08
	ld	(0x09, sp), a
;	../printf_large.c: 673: break;
	jra	00160$
;	../printf_large.c: 675: case 'U':
00156$:
;	../printf_large.c: 676: radix = 10;
	ld	a, #0x0a
	ld	(0x09, sp), a
;	../printf_large.c: 677: break;
	jra	00160$
;	../printf_large.c: 679: case 'X':
00157$:
;	../printf_large.c: 680: radix = 16;
	ld	a, #0x10
	ld	(0x09, sp), a
;	../printf_large.c: 681: break;
	jra	00160$
;	../printf_large.c: 683: case 'F':
00158$:
;	../printf_large.c: 684: float_argument=1;
	ld	a, #0x01
	ld	(0x11, sp), a
;	../printf_large.c: 685: break;
	jra	00160$
;	../printf_large.c: 687: default:
00159$:
;	../printf_large.c: 689: OUTPUT_CHAR( c, p );
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x7b, sp)
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 872: return charsOutputted;
	jra	00160$
;	../printf_large.c: 691: }
00314$:
	ldw	(0x87, sp), x
	ld	(0x7c, sp), a
00160$:
;	../printf_large.c: 693: if (float_argument)
	tnz	(0x11, sp)
	jreq	00226$
;	../printf_large.c: 695: value.f = va_arg(ap, float);
	ldw	x, sp
	addw	x, #11
	ldw	(0x69, sp), x
	ldw	x, (0x91, sp)
	addw	x, #0x0004
	ldw	(0x91, sp), x
	subw	x, #0x0004
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	ldw	(0x65, sp), x
	ldw	x, (0x69, sp)
	ldw	(0x2, x), y
	ldw	y, (0x65, sp)
	ldw	(x), y
;	../printf_large.c: 697: PTR="<NO FLOAT>";
	ldw	x, sp
	addw	x, #11
	ldw	(0x63, sp), x
	ldw	y, (0x83, sp)
	ldw	x, (0x63, sp)
	ldw	(x), y
;	../printf_large.c: 698: while (c=*PTR++)
	ldw	y, (0x87, sp)
	ldw	(0x61, sp), y
00161$:
	ldw	x, (0x63, sp)
	ldw	x, (x)
	ldw	(0x5f, sp), x
	ldw	x, (0x5f, sp)
	incw	x
	ldw	(0x5d, sp), x
	ldw	x, (0x63, sp)
	ldw	y, (0x5d, sp)
	ldw	(x), y
	ldw	x, (0x5f, sp)
	ld	a, (x)
	ld	xh, a
	tnz	a
	jrne	00638$
	jp	00231$
00638$:
;	../printf_large.c: 700: OUTPUT_CHAR (c, p);
	ldw	y, (0x8d, sp)
	pushw	y
	ld	a, xh
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x61, sp)
	incw	x
	ldw	(0x61, sp), x
	ldw	y, (0x61, sp)
	ldw	(0x87, sp), y
	jra	00161$
00226$:
;	../printf_large.c: 718: else if (radix != 0)
	tnz	(0x09, sp)
	jrne	00639$
	jp	00231$
00639$:
;	../printf_large.c: 723: unsigned char MEM_SPACE_BUF_PP *pstore = &store[5];
	ldw	y, (0x81, sp)
	ldw	(0x5b, sp), y
;	../printf_large.c: 726: if (char_argument)
	tnz	(0x13, sp)
	jreq	00172$
;	../printf_large.c: 728: value.l = va_arg(ap, char);
	ldw	x, sp
	addw	x, #11
	ldw	(0x59, sp), x
	ldw	x, (0x91, sp)
	incw	x
	ldw	(0x91, sp), x
	decw	x
	ld	a, (x)
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ld	(0x56, sp), a
	ld	(0x55, sp), a
	ldw	y, (0x59, sp)
	ldw	(0x2, y), x
	ldw	x, (0x55, sp)
	ldw	(y), x
;	../printf_large.c: 729: if (!signed_argument)
	tnz	(0x14, sp)
	jrne	00173$
;	../printf_large.c: 731: value.l &= 0xFF;
	ldw	x, (0x59, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	clr	a
	ld	yh, a
	clr	(0x52, sp)
	clr	(0x51, sp)
	ldw	x, (0x59, sp)
	ldw	(0x2, x), y
	ldw	y, (0x51, sp)
	ldw	(x), y
	jra	00173$
00172$:
;	../printf_large.c: 734: else if (long_argument)
	tnz	(0x12, sp)
	jreq	00169$
;	../printf_large.c: 736: value.l = va_arg(ap, long);
	ldw	x, sp
	addw	x, #11
	ldw	(0x4f, sp), x
	ldw	x, (0x91, sp)
	addw	x, #0x0004
	ldw	(0x91, sp), x
	subw	x, #0x0004
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	ldw	(0x4b, sp), x
	ldw	x, (0x4f, sp)
	ldw	(0x2, x), y
	ldw	y, (0x4b, sp)
	ldw	(x), y
	jra	00173$
00169$:
;	../printf_large.c: 740: value.l = va_arg(ap, int);
	ldw	x, sp
	addw	x, #11
	ldw	y, (0x91, sp)
	addw	y, #0x0002
	ldw	(0x91, sp), y
	subw	y, #0x0002
	ldw	y, (y)
	ld	a, yh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x48, sp), a
	ld	(0x47, sp), a
	ldw	(0x2, x), y
	ldw	y, (0x47, sp)
	ldw	(x), y
;	../printf_large.c: 741: if (!signed_argument)
	tnz	(0x14, sp)
	jrne	00173$
;	../printf_large.c: 743: value.l &= 0xFFFF;
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ld	yh, a
	ld	a, (0x1, x)
	ld	(0x44, sp), a
	ld	a, (x)
	clr	(0x40, sp)
	clr	(0x3f, sp)
	ldw	(0x2, x), y
	ldw	y, (0x3f, sp)
	ldw	(x), y
00173$:
;	../printf_large.c: 747: if ( signed_argument )
	tnz	(0x14, sp)
	jreq	00178$
;	../printf_large.c: 749: if (value.l < 0)
	ldw	x, sp
	addw	x, #11
	ldw	(0x3d, sp), x
	ldw	x, (0x3d, sp)
	ld	a, (0x3, x)
	ld	(0x3c, sp), a
	ld	a, (0x2, x)
	ldw	x, (x)
	tnzw	x
	jrpl	00175$
;	../printf_large.c: 750: value.l = -value.l;
	ldw	x, (0x3d, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	ldw	(0x35, sp), x
	ld	yh, a
	negw	y
	clr	a
	sbc	a, (0x36, sp)
	ld	(0x32, sp), a
	clr	a
	sbc	a, (0x35, sp)
	ld	(0x31, sp), a
	ldw	x, (0x3d, sp)
	ldw	(0x2, x), y
	ldw	y, (0x31, sp)
	ldw	(x), y
	jra	00178$
00175$:
;	../printf_large.c: 752: signed_argument = 0;
	clr	(0x14, sp)
00178$:
;	../printf_large.c: 756: lsd = 1;
	ld	a, #0x01
	ld	(0x0a, sp), a
;	../printf_large.c: 758: do {
	ldw	y, (0x5b, sp)
	ldw	(0x2f, sp), y
	clr	(0x07, sp)
00182$:
;	../printf_large.c: 759: value.byte[4] = 0;
	ldw	x, sp
	addw	x, #15
	clr	(x)
;	../printf_large.c: 761: calculate_digit(&value, radix);
	ldw	x, (0x7f, sp)
	ld	a, (0x09, sp)
	push	a
	pushw	x
	call	_calculate_digit
	addw	sp, #3
;	../printf_large.c: 765: if (!lsd)
	tnz	(0x0a, sp)
	jrne	00180$
;	../printf_large.c: 767: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	ldw	x, (0x7d, sp)
	ld	a, (x)
	swap	a
	and	a, #0xf0
	ld	(0x2e, sp), a
	ldw	x, (0x7d, sp)
	ld	a, (x)
	swap	a
	and	a, #0x0f
	or	a, (0x2e, sp)
	ld	(0x2d, sp), a
	ldw	x, (0x2f, sp)
	ld	a, (x)
	or	a, (0x2d, sp)
	ldw	x, (0x2f, sp)
	ld	(x), a
;	../printf_large.c: 768: pstore--;
	ldw	x, (0x2f, sp)
	decw	x
	ldw	(0x2f, sp), x
	jra	00181$
00180$:
;	../printf_large.c: 772: *pstore = value.byte[4];
	ldw	x, (0x7d, sp)
	ld	a, (x)
	ldw	x, (0x2f, sp)
	ld	(x), a
00181$:
;	../printf_large.c: 774: length++;
	inc	(0x07, sp)
;	../printf_large.c: 775: lsd = !lsd;
	ld	a, (0x0a, sp)
	sub	a, #0x01
	clr	a
	rlc	a
	ld	(0x0a, sp), a
;	../printf_large.c: 776: } while( value.ul );
	ldw	x, (0x7f, sp)
	ld	a, (0x3, x)
	ld	(0x2c, sp), a
	ld	a, (0x2, x)
	ld	(0x2b, sp), a
	ldw	x, (x)
	ldw	y, (0x2b, sp)
	jrne	00182$
	tnzw	x
	jrne	00182$
;	../printf_large.c: 778: if (width == 0)
	ldw	y, (0x2f, sp)
	ldw	(0x27, sp), y
	ld	a, (0x07, sp)
	ld	(0x26, sp), a
	tnz	(0x7c, sp)
	jrne	00186$
;	../printf_large.c: 783: width = 1;
	ld	a, #0x01
	ld	(0x7c, sp), a
00186$:
;	../printf_large.c: 787: if (!zero_padding && !left_justify)
	tnz	(0x17, sp)
	jrne	00191$
	tnz	(0x18, sp)
	jrne	00191$
;	../printf_large.c: 789: while ( width > (unsigned char) (length+1) )
	ld	a, (0x26, sp)
	inc	a
	ld	(0x25, sp), a
	ldw	y, (0x87, sp)
	ldw	(0x23, sp), y
	ld	a, (0x7c, sp)
00187$:
	cp	a, (0x25, sp)
	jrule	00316$
;	../printf_large.c: 791: OUTPUT_CHAR( ' ', p );
	push	a
	ldw	x, (0x8e, sp)
	pushw	x
	push	#0x20
	ldw	x, (0x8f, sp)
	call	(x)
	addw	sp, #3
	pop	a
	ldw	x, (0x23, sp)
	incw	x
	ldw	(0x23, sp), x
;	../printf_large.c: 792: width--;
	dec	a
	jra	00187$
00316$:
	ldw	y, (0x23, sp)
	ldw	(0x87, sp), y
	ld	(0x7c, sp), a
00191$:
;	../printf_large.c: 796: if (signed_argument) // this now means the original value was negative
	tnz	(0x14, sp)
	jreq	00201$
;	../printf_large.c: 798: OUTPUT_CHAR( '-', p );
	ldw	x, (0x8d, sp)
	pushw	x
	push	#0x2d
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 800: width--;
	ld	a, (0x7c, sp)
	dec	a
	ld	(0x7c, sp), a
	jra	00202$
00201$:
;	../printf_large.c: 802: else if (length != 0)
	tnz	(0x26, sp)
	jreq	00202$
;	../printf_large.c: 805: if (prefix_sign)
	tnz	(0x16, sp)
	jreq	00196$
;	../printf_large.c: 807: OUTPUT_CHAR( '+', p );
	ldw	x, (0x8d, sp)
	pushw	x
	push	#0x2b
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 809: width--;
	ld	a, (0x7c, sp)
	dec	a
	ld	(0x7c, sp), a
	jra	00202$
00196$:
;	../printf_large.c: 811: else if (prefix_space)
	tnz	(0x15, sp)
	jreq	00202$
;	../printf_large.c: 813: OUTPUT_CHAR( ' ', p );
	ldw	x, (0x8d, sp)
	pushw	x
	push	#0x20
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
;	../printf_large.c: 815: width--;
	ld	a, (0x7c, sp)
	dec	a
	ld	(0x7c, sp), a
00202$:
;	../printf_large.c: 820: if (!left_justify)
	tnz	(0x18, sp)
	jrne	00210$
;	../printf_large.c: 822: while ( width-- > length )
	ldw	y, (0x87, sp)
	ldw	(0x21, sp), y
	ld	a, (0x7c, sp)
	ld	(0x20, sp), a
00203$:
	ld	a, (0x20, sp)
	dec	(0x20, sp)
	cp	a, (0x26, sp)
	jrule	00317$
;	../printf_large.c: 824: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	tnz	(0x17, sp)
	jreq	00236$
	ld	a, #0x30
	jra	00237$
00236$:
	ld	a, #0x20
00237$:
	ldw	x, (0x8d, sp)
	pushw	x
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x21, sp)
	incw	x
	ldw	(0x21, sp), x
	jra	00203$
00210$:
;	../printf_large.c: 830: if (width > length)
	ld	a, (0x7c, sp)
	cp	a, (0x26, sp)
	jrule	00207$
;	../printf_large.c: 831: width -= length;
	ld	a, (0x7c, sp)
	sub	a, (0x26, sp)
	ld	(0x1f, sp), a
	jra	00309$
00207$:
;	../printf_large.c: 833: width = 0;
	clr	(0x1f, sp)
;	../printf_large.c: 872: return charsOutputted;
	jra	00309$
;	../printf_large.c: 837: while( length-- )
00317$:
	ldw	y, (0x21, sp)
	ldw	(0x87, sp), y
	ld	a, (0x20, sp)
	ld	(0x1f, sp), a
00309$:
	ldw	y, (0x27, sp)
	ldw	(0x1d, sp), y
	ldw	y, (0x87, sp)
	ldw	(0x1b, sp), y
	ld	a, (0x26, sp)
	ld	(0x1a, sp), a
00215$:
	ld	a, (0x1a, sp)
	dec	(0x1a, sp)
	tnz	a
	jreq	00318$
;	../printf_large.c: 839: lsd = !lsd;
	ld	a, (0x0a, sp)
	sub	a, #0x01
	clr	a
	rlc	a
	ld	(0x0a, sp), a
;	../printf_large.c: 840: if (!lsd)
	tnz	(0x0a, sp)
	jrne	00213$
;	../printf_large.c: 842: pstore++;
	ldw	x, (0x1d, sp)
	incw	x
	ldw	(0x1d, sp), x
;	../printf_large.c: 843: value.byte[4] = *pstore >> 4;
	ldw	x, (0x1d, sp)
	ld	a, (x)
	swap	a
	and	a, #0x0f
	ldw	x, (0x7d, sp)
	ld	(x), a
	jra	00214$
00213$:
;	../printf_large.c: 847: value.byte[4] = *pstore & 0x0F;
	ldw	x, (0x1d, sp)
	ld	a, (x)
	and	a, #0x0f
	ldw	x, (0x7d, sp)
	ld	(x), a
00214$:
;	../printf_large.c: 850: output_digit( value.byte[4], lower_case, output_char, p );
	ldw	x, (0x7d, sp)
	ld	a, (x)
	ld	yh, a
	ldw	x, (0x8d, sp)
	pushw	x
	ldw	x, (0x8d, sp)
	pushw	x
	ld	a, (0x14, sp)
	push	a
	ld	a, yh
	push	a
	call	_output_digit
	addw	sp, #6
;	../printf_large.c: 851: charsOutputted++;
	ldw	x, (0x1b, sp)
	incw	x
	ldw	(0x1b, sp), x
	jra	00215$
00318$:
	ldw	y, (0x1b, sp)
	ldw	(0x87, sp), y
;	../printf_large.c: 856: if (left_justify)
	tnz	(0x18, sp)
	jrne	00663$
	jp	00231$
00663$:
;	../printf_large.c: 858: while (width-- > 0)
	ldw	x, (0x1b, sp)
	ld	a, (0x1f, sp)
00218$:
	ld	(0x19, sp), a
	dec	a
	tnz	(0x19, sp)
	jrne	00664$
	jp	00231$
00664$:
;	../printf_large.c: 860: OUTPUT_CHAR(' ', p);
	push	a
	pushw	x
	ldw	y, (0x90, sp)
	pushw	y
	push	#0x20
	ldw	x, (0x91, sp)
	call	(x)
	addw	sp, #3
	popw	x
	pop	a
	incw	x
	ldw	(0x87, sp), x
	jra	00218$
00229$:
;	../printf_large.c: 868: OUTPUT_CHAR( c, p );
	ldw	y, (0x8d, sp)
	pushw	y
	ld	a, xh
	push	a
	ldw	x, (0x8e, sp)
	call	(x)
	addw	sp, #3
	ldw	x, (0x87, sp)
	incw	x
	ldw	(0x87, sp), x
	jp	00231$
00233$:
;	../printf_large.c: 872: return charsOutputted;
	ldw	x, (0x87, sp)
	addw	sp, #136
	ret
	.area CODE
___str_0:
	.ascii "<NO FLOAT>"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
