#line 1 "C:/Users/dell/OneDrive/Documents/projectEm/code/ProjectTraffic.c"
#line 14 "C:/Users/dell/OneDrive/Documents/projectEm/code/ProjectTraffic.c"
signed char count1=15;
signed char count2=23;
signed char count;
void counter(signed char count){
 char left=count/10;
 char right=count%10;
 portb=right;
 portd=left;
 delay_ms(800);

 }

void automatic_mode(){
 while( porte.b1 ==0){
 portc=0b00100001;
  porta.B0 =0;
  porta.B1 =0;
  porta.B2 =0;
  porta.B3 =0;
 for(;count1>=0;count1--){
 if(count1==3) { portc=0b00010001; }
 counter(count1);
 if ( porte.b1  == 1) return;

 }
 portc=0b00001100;
 for(;count2>=0;count2--){
 if(count2==3) portc=0b00001010;
 counter(count2);
 if ( porte.b1 == 1) return;

 }
 count1=15;
 count2=23;}
 }

void manual_mode(){
 if( porte.b0  ==0) {
 if( portc.b0 ==1){
  porta.B0 =0;
  porta.B1 =0;
  porta.B2 =0;
  porta.B3 =0;
 PORTC = 0b00010001;
 for(count=3;count>=0;count--){
 counter(count);
 if ( porte.b1 ==0) return;
 }
 portc=0b00001100;
  porta.B0 =1;
  porta.B1 =1;
  porta.B2 =1;
  porta.B3 =1;

 }
 else if( portc.b3 ==1) {
  porta.B0 =0;
  porta.B1 =0;
  porta.B2 =0;
  porta.B3 =0;
 PORTC = 0b00001010;
 for(count=3;count>=0;count--){
 counter(count);
 if ( porte.b1 ==0) return;
 }
 PORTC = 0b00100001;
 porta.b0=1;
 porta.b1=1;
 porta.B2=1;
 porta.B3=1;

 }
 }
 }

void main() {
 adcon1=7;
 trisa=0; porta=0b11111111;
 trisb=0b00000000; portb=0b00000000;
 trisc=0; portc=0b00000000;
 trisd=0; portd=0b00000000;
 trise=0b00000011;
 while (1) {
 if ( porte.b1  == 0){
 automatic_mode();
 }
 else
 manual_mode();


 }

}
