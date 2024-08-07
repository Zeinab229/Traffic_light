#define red_w portc.b0
#define yellow_w portc.b1
#define green_w portc.b2
#define red_s portc.b3
#define yelllow_s portc.b4
#define green_s portc.b5
#define t1 porta.B0
#define t2 porta.B1
#define t3 porta.B2
#define t4 porta.B3
#define selector porte.b0
#define automatic porte.b1

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
    while(automatic==0){
       portc=0b00100001; //west red ,south green
       t1=0;
       t2=0;
       t3=0;
       t4=0;
       for(;count1>=0;count1--){
          if(count1==3) { portc=0b00010001; } //south yellow
            counter(count1);
             if (automatic == 1) return;     //automatic released

            }
       portc=0b00001100;   // west green ,south red
        for(;count2>=0;count2--){
            if(count2==3)    portc=0b00001010;   //west yellow
            counter(count2);
             if (automatic== 1) return;  //automatic released

            }
       count1=15;
       count2=23;}
    }

void manual_mode(){
    if(selector ==0) {
     if(red_w==1){
      t1=0;
      t2=0;
      t3=0;
      t4=0;
      PORTC = 0b00010001;   //south yellow, west red still
      for(count=3;count>=0;count--){
             counter(count);
            if (automatic==0) return;
          }
      portc=0b00001100;  //south red ,west green
      t1=1;
      t2=1;     //turn off all 7segments
      t3=1;
      t4=1;

        }
     else if(red_s==1) {
       t1=0;
       t2=0;
       t3=0;
       t4=0;
       PORTC = 0b00001010;   //west yellow ,south red still
       for(count=3;count>=0;count--){
           counter(count);
           if (automatic==0) return;
           }
       PORTC = 0b00100001;  //west red ,south green
       porta.b0=1;
       porta.b1=1;    //turn off all 7segments
       porta.B2=1;
       porta.B3=1;

    }
 }
   }

void main() {
       adcon1=7;
       trisa=0;             porta=0b11111111;
       trisb=0b00000000;    portb=0b00000000;
       trisc=0;             portc=0b00000000;
       trisd=0;             portd=0b00000000;
       trise=0b00000011;
       while (1) {
        if (automatic == 0){
            automatic_mode();
            }
        else
           manual_mode();


   }

}