
_manualm:

;embdd.c,7 :: 		void manualm(){
;embdd.c,8 :: 		if(manualC==2||manualC==0){
	MOVLW      0
	XORWF      _manualC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm44
	MOVLW      2
	XORWF      _manualC+0, 0
L__manualm44:
	BTFSC      STATUS+0, 2
	GOTO       L__manualm42
	MOVLW      0
	XORWF      _manualC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm45
	MOVLW      0
	XORWF      _manualC+0, 0
L__manualm45:
	BTFSC      STATUS+0, 2
	GOTO       L__manualm42
	GOTO       L_manualm2
L__manualm42:
;embdd.c,9 :: 		portc=leds[manualC];
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;embdd.c,10 :: 		manualC++;
	INCF       _manualC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manualC+1, 1
;embdd.c,12 :: 		for(mm=3;mm>=1;mm--){
	MOVLW      3
	MOVWF      _mm+0
	MOVLW      0
	MOVWF      _mm+1
L_manualm3:
	MOVLW      128
	XORWF      _mm+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm46
	MOVLW      1
	SUBWF      _mm+0, 0
L__manualm46:
	BTFSS      STATUS+0, 0
	GOTO       L_manualm4
;embdd.c,13 :: 		x=mm%10;     num=mm/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mm+0, 0
	MOVWF      R0+0
	MOVF       _mm+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mm+0, 0
	MOVWF      R0+0
	MOVF       _mm+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _num+0
;embdd.c,14 :: 		for(nn=1;nn<=50;nn++){
	MOVLW      1
	MOVWF      _nn+0
L_manualm6:
	MOVF       _nn+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_manualm7
;embdd.c,15 :: 		porte.b0=0;
	BCF        PORTE+0, 0
;embdd.c,16 :: 		porta.B5=1;
	BSF        PORTA+0, 5
;embdd.c,17 :: 		porte.b1=1;
	BSF        PORTE+0, 1
;embdd.c,18 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;embdd.c,19 :: 		portb=x<<1;     portd=x;
	MOVF       _x+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       _x+0, 0
	MOVWF      PORTD+0
;embdd.c,21 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manualm9:
	DECFSZ     R13+0, 1
	GOTO       L_manualm9
	DECFSZ     R12+0, 1
	GOTO       L_manualm9
	NOP
;embdd.c,23 :: 		porte.b0=1;
	BSF        PORTE+0, 0
;embdd.c,24 :: 		porta.B5=0;
	BCF        PORTA+0, 5
;embdd.c,25 :: 		porte.b1=0;
	BCF        PORTE+0, 1
;embdd.c,26 :: 		porta.b2=1;
	BSF        PORTA+0, 2
;embdd.c,27 :: 		portb=num<<1;     portd=num;
	MOVF       _num+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       _num+0, 0
	MOVWF      PORTD+0
;embdd.c,28 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manualm10:
	DECFSZ     R13+0, 1
	GOTO       L_manualm10
	DECFSZ     R12+0, 1
	GOTO       L_manualm10
	NOP
;embdd.c,14 :: 		for(nn=1;nn<=50;nn++){
	INCF       _nn+0, 1
;embdd.c,29 :: 		}
	GOTO       L_manualm6
L_manualm7:
;embdd.c,12 :: 		for(mm=3;mm>=1;mm--){
	MOVLW      1
	SUBWF      _mm+0, 1
	BTFSS      STATUS+0, 0
	DECF       _mm+1, 1
;embdd.c,30 :: 		}
	GOTO       L_manualm3
L_manualm4:
;embdd.c,32 :: 		}
L_manualm2:
;embdd.c,33 :: 		porta=0; porte=0;
	CLRF       PORTA+0
	CLRF       PORTE+0
;embdd.c,34 :: 		portb=0<<1;     portd=0;
	CLRF       PORTB+0
	CLRF       PORTD+0
;embdd.c,36 :: 		portc=leds[manualC];  portc.B6=1;
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
	BSF        PORTC+0, 6
;embdd.c,38 :: 		}
L_end_manualm:
	RETURN
; end of _manualm

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;embdd.c,41 :: 		void interrupt(){
;embdd.c,42 :: 		if(INTF_bit==1 ){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt11
;embdd.c,43 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;embdd.c,44 :: 		if(portc.b7==0){
	BTFSC      PORTC+0, 7
	GOTO       L_interrupt12
;embdd.c,45 :: 		if(manualC==3){manualC=0;}
	MOVLW      0
	XORWF      _manualC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt49
	MOVLW      3
	XORWF      _manualC+0, 0
L__interrupt49:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
	CLRF       _manualC+0
	CLRF       _manualC+1
	GOTO       L_interrupt14
L_interrupt13:
;embdd.c,46 :: 		else{manualC++;}
	INCF       _manualC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manualC+1, 1
L_interrupt14:
;embdd.c,47 :: 		manualm();      }
	CALL       _manualm+0
L_interrupt12:
;embdd.c,48 :: 		}
L_interrupt11:
;embdd.c,49 :: 		}
L_end_interrupt:
L__interrupt48:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_automm:

;embdd.c,52 :: 		void automm(){
;embdd.c,53 :: 		while(portc.b7==1){
L_automm15:
	BTFSS      PORTC+0, 7
	GOTO       L_automm16
;embdd.c,54 :: 		manualC=0; k=3;portc=leds[manualC];
	CLRF       _manualC+0
	CLRF       _manualC+1
	MOVLW      3
	MOVWF      _k+0
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;embdd.c,55 :: 		for(i=23;i>0;i--){
	MOVLW      23
	MOVWF      _i+0
L_automm17:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_automm18
;embdd.c,56 :: 		if(i==20){
	MOVF       _i+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_automm20
;embdd.c,57 :: 		k=20;manualC++; portc=leds[manualC];
	MOVLW      20
	MOVWF      _k+0
	INCF       _manualC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manualC+1, 1
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;embdd.c,58 :: 		}
L_automm20:
;embdd.c,59 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	CLRF       _j+0
L_automm21:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_automm22
	BTFSC      PORTC+0, 7
	GOTO       L_automm24
	GOTO       L_end_automm
L_automm24:
;embdd.c,61 :: 		rs=i%10;   rw=k%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__automm+1
	MOVF       FLOC__automm+1, 0
	MOVWF      _rs+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__automm+0
	MOVF       FLOC__automm+0, 0
	MOVWF      _rw+0
;embdd.c,62 :: 		Ls=i/10;       Lw=k/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Ls+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Lw+0
;embdd.c,64 :: 		porta.B5=1;   portE.B1=1;                       //ls off
	BSF        PORTA+0, 5
	BSF        PORTE+0, 1
;embdd.c,65 :: 		porta.b2=0;   portE.B0=0;                       //s on
	BCF        PORTA+0, 2
	BCF        PORTE+0, 0
;embdd.c,66 :: 		portd=rS;        portb=rw<<1;
	MOVF       FLOC__automm+1, 0
	MOVWF      PORTD+0
	MOVF       FLOC__automm+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;embdd.c,67 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_automm25:
	DECFSZ     R13+0, 1
	GOTO       L_automm25
	DECFSZ     R12+0, 1
	GOTO       L_automm25
	NOP
;embdd.c,69 :: 		porta.B5=0;   portE.B1=0;                                            //l on
	BCF        PORTA+0, 5
	BCF        PORTE+0, 1
;embdd.c,70 :: 		porta.b2=1;    portE.B0=1;                     //r off
	BSF        PORTA+0, 2
	BSF        PORTE+0, 0
;embdd.c,71 :: 		portd=Ls;     portb=Lw<<1;
	MOVF       _Ls+0, 0
	MOVWF      PORTD+0
	MOVF       _Lw+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;embdd.c,72 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_automm26:
	DECFSZ     R13+0, 1
	GOTO       L_automm26
	DECFSZ     R12+0, 1
	GOTO       L_automm26
	NOP
;embdd.c,59 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	INCF       _j+0, 1
;embdd.c,73 :: 		}
	GOTO       L_automm21
L_automm22:
;embdd.c,74 :: 		k--;    if(k==0){k=1;}
	DECF       _k+0, 1
	MOVF       _k+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_automm27
	MOVLW      1
	MOVWF      _k+0
L_automm27:
;embdd.c,55 :: 		for(i=23;i>0;i--){
	DECF       _i+0, 1
;embdd.c,75 :: 		}
	GOTO       L_automm17
L_automm18:
;embdd.c,77 :: 		k=3; manualC++;    portc=leds[manualC];
	MOVLW      3
	MOVWF      _k+0
	INCF       _manualC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manualC+1, 1
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;embdd.c,78 :: 		for(i=15;i>0;i--){
	MOVLW      15
	MOVWF      _i+0
L_automm28:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_automm29
;embdd.c,79 :: 		if(i==12){k=12;manualC++;portc=leds[manualC];}
	MOVF       _i+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_automm31
	MOVLW      12
	MOVWF      _k+0
	INCF       _manualC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manualC+1, 1
	MOVF       _manualC+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
L_automm31:
;embdd.c,80 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	CLRF       _j+0
L_automm32:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_automm33
	BTFSC      PORTC+0, 7
	GOTO       L_automm35
	GOTO       L_end_automm
L_automm35:
;embdd.c,82 :: 		rs=k%10;   rw=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__automm+1
	MOVF       FLOC__automm+1, 0
	MOVWF      _rs+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__automm+0
	MOVF       FLOC__automm+0, 0
	MOVWF      _rw+0
;embdd.c,83 :: 		Ls=k/10;       Lw=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Ls+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Lw+0
;embdd.c,85 :: 		porta.B5=1;   portE.B1=1;                       //ls off
	BSF        PORTA+0, 5
	BSF        PORTE+0, 1
;embdd.c,86 :: 		porta.b2=0;   portE.B0=0;                       //s on
	BCF        PORTA+0, 2
	BCF        PORTE+0, 0
;embdd.c,87 :: 		portd=rs;        portb=rw<<1;
	MOVF       FLOC__automm+1, 0
	MOVWF      PORTD+0
	MOVF       FLOC__automm+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;embdd.c,88 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_automm36:
	DECFSZ     R13+0, 1
	GOTO       L_automm36
	DECFSZ     R12+0, 1
	GOTO       L_automm36
	NOP
;embdd.c,90 :: 		porta.B5=0;   portE.B1=0;                                            //l on
	BCF        PORTA+0, 5
	BCF        PORTE+0, 1
;embdd.c,91 :: 		porta.b2=1;    portE.B0=1;                     //r off
	BSF        PORTA+0, 2
	BSF        PORTE+0, 0
;embdd.c,92 :: 		portd=Ls;     portb=Lw<<1;
	MOVF       _Ls+0, 0
	MOVWF      PORTD+0
	MOVF       _Lw+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;embdd.c,93 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_automm37:
	DECFSZ     R13+0, 1
	GOTO       L_automm37
	DECFSZ     R12+0, 1
	GOTO       L_automm37
	NOP
;embdd.c,80 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	INCF       _j+0, 1
;embdd.c,95 :: 		}
	GOTO       L_automm32
L_automm33:
;embdd.c,96 :: 		k--;
	DECF       _k+0, 1
;embdd.c,78 :: 		for(i=15;i>0;i--){
	DECF       _i+0, 1
;embdd.c,97 :: 		}
	GOTO       L_automm28
L_automm29:
;embdd.c,98 :: 		}
	GOTO       L_automm15
L_automm16:
;embdd.c,103 :: 		}
L_end_automm:
	RETURN
; end of _automm

_main:

;embdd.c,104 :: 		void main() {
;embdd.c,105 :: 		TRISB=0b00000001;PORTB=0;   GIE_bit=1;
	MOVLW      1
	MOVWF      TRISB+0
	CLRF       PORTB+0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;embdd.c,106 :: 		INTE_BIT=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;embdd.c,107 :: 		INTEDG_bit=1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;embdd.c,108 :: 		TRISE=0;PORTE=0;
	CLRF       TRISE+0
	CLRF       PORTE+0
;embdd.c,109 :: 		TRISC=0b10000000;PORTC=0;
	MOVLW      128
	MOVWF      TRISC+0
	CLRF       PORTC+0
;embdd.c,110 :: 		TRISA=0b000001;//PORTA=0;
	MOVLW      1
	MOVWF      TRISA+0
;embdd.c,111 :: 		TRISD=0;PORTD=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;embdd.c,114 :: 		while(1){
L_main38:
;embdd.c,115 :: 		if(portc.b7==1){
	BTFSS      PORTC+0, 7
	GOTO       L_main40
;embdd.c,116 :: 		automm();}
	CALL       _automm+0
	GOTO       L_main41
L_main40:
;embdd.c,118 :: 		manualm();}
	CALL       _manualm+0
L_main41:
;embdd.c,120 :: 		}}
	GOTO       L_main38
L_end_main:
	GOTO       $+0
; end of _main
