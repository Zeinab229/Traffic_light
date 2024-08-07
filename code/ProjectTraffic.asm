
_counter:

;ProjectTraffic.c,17 :: 		void counter(signed char count){
;ProjectTraffic.c,18 :: 		char left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;ProjectTraffic.c,20 :: 		portb=right;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ProjectTraffic.c,21 :: 		portd=left;
	MOVF       FLOC__counter+0, 0
	MOVWF      PORTD+0
;ProjectTraffic.c,22 :: 		delay_ms(800);
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_counter0:
	DECFSZ     R13+0, 1
	GOTO       L_counter0
	DECFSZ     R12+0, 1
	GOTO       L_counter0
	DECFSZ     R11+0, 1
	GOTO       L_counter0
	NOP
;ProjectTraffic.c,24 :: 		}
L_end_counter:
	RETURN
; end of _counter

_automatic_mode:

;ProjectTraffic.c,26 :: 		void automatic_mode(){
;ProjectTraffic.c,27 :: 		while(automatic==0){
L_automatic_mode1:
	BTFSC      PORTE+0, 1
	GOTO       L_automatic_mode2
;ProjectTraffic.c,28 :: 		portc=0b00100001; //west red ,south green
	MOVLW      33
	MOVWF      PORTC+0
;ProjectTraffic.c,29 :: 		t1=0;
	BCF        PORTA+0, 0
;ProjectTraffic.c,30 :: 		t2=0;
	BCF        PORTA+0, 1
;ProjectTraffic.c,31 :: 		t3=0;
	BCF        PORTA+0, 2
;ProjectTraffic.c,32 :: 		t4=0;
	BCF        PORTA+0, 3
;ProjectTraffic.c,33 :: 		for(;count1>=0;count1--){
L_automatic_mode3:
	MOVLW      128
	XORWF      _count1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_automatic_mode4
;ProjectTraffic.c,34 :: 		if(count1==3) { portc=0b00010001; } //south yellow
	MOVF       _count1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_automatic_mode6
	MOVLW      17
	MOVWF      PORTC+0
L_automatic_mode6:
;ProjectTraffic.c,35 :: 		counter(count1);
	MOVF       _count1+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;ProjectTraffic.c,36 :: 		if (automatic == 1) return;     //automatic released
	BTFSS      PORTE+0, 1
	GOTO       L_automatic_mode7
	GOTO       L_end_automatic_mode
L_automatic_mode7:
;ProjectTraffic.c,33 :: 		for(;count1>=0;count1--){
	DECF       _count1+0, 1
;ProjectTraffic.c,38 :: 		}
	GOTO       L_automatic_mode3
L_automatic_mode4:
;ProjectTraffic.c,39 :: 		portc=0b00001100;   // west green ,south red
	MOVLW      12
	MOVWF      PORTC+0
;ProjectTraffic.c,40 :: 		for(;count2>=0;count2--){
L_automatic_mode8:
	MOVLW      128
	XORWF      _count2+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_automatic_mode9
;ProjectTraffic.c,41 :: 		if(count2==3)    portc=0b00001010;   //west yellow
	MOVF       _count2+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_automatic_mode11
	MOVLW      10
	MOVWF      PORTC+0
L_automatic_mode11:
;ProjectTraffic.c,42 :: 		counter(count2);
	MOVF       _count2+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;ProjectTraffic.c,43 :: 		if (automatic== 1) return;  //automatic released
	BTFSS      PORTE+0, 1
	GOTO       L_automatic_mode12
	GOTO       L_end_automatic_mode
L_automatic_mode12:
;ProjectTraffic.c,40 :: 		for(;count2>=0;count2--){
	DECF       _count2+0, 1
;ProjectTraffic.c,45 :: 		}
	GOTO       L_automatic_mode8
L_automatic_mode9:
;ProjectTraffic.c,46 :: 		count1=15;
	MOVLW      15
	MOVWF      _count1+0
;ProjectTraffic.c,47 :: 		count2=23;}
	MOVLW      23
	MOVWF      _count2+0
	GOTO       L_automatic_mode1
L_automatic_mode2:
;ProjectTraffic.c,48 :: 		}
L_end_automatic_mode:
	RETURN
; end of _automatic_mode

_manual_mode:

;ProjectTraffic.c,50 :: 		void manual_mode(){
;ProjectTraffic.c,51 :: 		if(selector ==0) {
	BTFSC      PORTE+0, 0
	GOTO       L_manual_mode13
;ProjectTraffic.c,52 :: 		if(red_w==1){
	BTFSS      PORTC+0, 0
	GOTO       L_manual_mode14
;ProjectTraffic.c,53 :: 		t1=0;
	BCF        PORTA+0, 0
;ProjectTraffic.c,54 :: 		t2=0;
	BCF        PORTA+0, 1
;ProjectTraffic.c,55 :: 		t3=0;
	BCF        PORTA+0, 2
;ProjectTraffic.c,56 :: 		t4=0;
	BCF        PORTA+0, 3
;ProjectTraffic.c,57 :: 		PORTC = 0b00010001;   //south yellow, west red still
	MOVLW      17
	MOVWF      PORTC+0
;ProjectTraffic.c,58 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual_mode15:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual_mode16
;ProjectTraffic.c,59 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;ProjectTraffic.c,60 :: 		if (automatic==0) return;
	BTFSC      PORTE+0, 1
	GOTO       L_manual_mode18
	GOTO       L_end_manual_mode
L_manual_mode18:
;ProjectTraffic.c,58 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;ProjectTraffic.c,61 :: 		}
	GOTO       L_manual_mode15
L_manual_mode16:
;ProjectTraffic.c,62 :: 		portc=0b00001100;  //south red ,west green
	MOVLW      12
	MOVWF      PORTC+0
;ProjectTraffic.c,63 :: 		t1=1;
	BSF        PORTA+0, 0
;ProjectTraffic.c,64 :: 		t2=1;     //turn off all 7segments
	BSF        PORTA+0, 1
;ProjectTraffic.c,65 :: 		t3=1;
	BSF        PORTA+0, 2
;ProjectTraffic.c,66 :: 		t4=1;
	BSF        PORTA+0, 3
;ProjectTraffic.c,68 :: 		}
	GOTO       L_manual_mode19
L_manual_mode14:
;ProjectTraffic.c,69 :: 		else if(red_s==1) {
	BTFSS      PORTC+0, 3
	GOTO       L_manual_mode20
;ProjectTraffic.c,70 :: 		t1=0;
	BCF        PORTA+0, 0
;ProjectTraffic.c,71 :: 		t2=0;
	BCF        PORTA+0, 1
;ProjectTraffic.c,72 :: 		t3=0;
	BCF        PORTA+0, 2
;ProjectTraffic.c,73 :: 		t4=0;
	BCF        PORTA+0, 3
;ProjectTraffic.c,74 :: 		PORTC = 0b00001010;   //west yellow ,south red still
	MOVLW      10
	MOVWF      PORTC+0
;ProjectTraffic.c,75 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual_mode21:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual_mode22
;ProjectTraffic.c,76 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;ProjectTraffic.c,77 :: 		if (automatic==0) return;
	BTFSC      PORTE+0, 1
	GOTO       L_manual_mode24
	GOTO       L_end_manual_mode
L_manual_mode24:
;ProjectTraffic.c,75 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;ProjectTraffic.c,78 :: 		}
	GOTO       L_manual_mode21
L_manual_mode22:
;ProjectTraffic.c,79 :: 		PORTC = 0b00100001;  //west red ,south green
	MOVLW      33
	MOVWF      PORTC+0
;ProjectTraffic.c,80 :: 		porta.b0=1;
	BSF        PORTA+0, 0
;ProjectTraffic.c,81 :: 		porta.b1=1;    //turn off all 7segments
	BSF        PORTA+0, 1
;ProjectTraffic.c,82 :: 		porta.B2=1;
	BSF        PORTA+0, 2
;ProjectTraffic.c,83 :: 		porta.B3=1;
	BSF        PORTA+0, 3
;ProjectTraffic.c,85 :: 		}
L_manual_mode20:
L_manual_mode19:
;ProjectTraffic.c,86 :: 		}
L_manual_mode13:
;ProjectTraffic.c,87 :: 		}
L_end_manual_mode:
	RETURN
; end of _manual_mode

_main:

;ProjectTraffic.c,89 :: 		void main() {
;ProjectTraffic.c,90 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;ProjectTraffic.c,91 :: 		trisa=0;             porta=0b11111111;
	CLRF       TRISA+0
	MOVLW      255
	MOVWF      PORTA+0
;ProjectTraffic.c,92 :: 		trisb=0b00000000;    portb=0b00000000;
	CLRF       TRISB+0
	CLRF       PORTB+0
;ProjectTraffic.c,93 :: 		trisc=0;             portc=0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;ProjectTraffic.c,94 :: 		trisd=0;             portd=0b00000000;
	CLRF       TRISD+0
	CLRF       PORTD+0
;ProjectTraffic.c,95 :: 		trise=0b00000011;
	MOVLW      3
	MOVWF      TRISE+0
;ProjectTraffic.c,96 :: 		while (1) {
L_main25:
;ProjectTraffic.c,97 :: 		if (automatic == 0){
	BTFSC      PORTE+0, 1
	GOTO       L_main27
;ProjectTraffic.c,98 :: 		automatic_mode();
	CALL       _automatic_mode+0
;ProjectTraffic.c,99 :: 		}
	GOTO       L_main28
L_main27:
;ProjectTraffic.c,101 :: 		manual_mode();
	CALL       _manual_mode+0
L_main28:
;ProjectTraffic.c,104 :: 		}
	GOTO       L_main25
;ProjectTraffic.c,106 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
