#line 1 "C:/Users/ahmed/OneDrive/Desktop/Emb Project/Soft/embdd.c"
char i=0; char Ls=0; char rs=0; char j=0; char k=3; char rw=0; char Lw=0;char a=0; char x;
char nn; char num;
int manualC=0; int mm=0;
char seg[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};
char leds[]={0b010001,0b100001,0b001010,0b001100};

void manualm(){
 if(manualC==2||manualC==0){
 portc=leds[manualC];
 manualC++;

 for(mm=3;mm>=1;mm--){
 x=mm%10; num=mm/10;
 for(nn=1;nn<=50;nn++){
 porte.b0=0;
 porta.B5=1;
 porte.b1=1;
 porta.b2=0;
 portb=x<<1; portd=x;

 Delay_ms(10);

 porte.b0=1;
 porta.B5=0;
 porte.b1=0;
 porta.b2=1;
 portb=num<<1; portd=num;
 Delay_ms(10);
 }
 }

 }
 porta=0; porte=0;
 portb=0<<1; portd=0;

 portc=leds[manualC]; portc.B6=1;

 }


 void interrupt(){
 if(INTF_bit==1 ){
 INTF_bit=0;
 if(portc.b7==0){
 if(manualC==3){manualC=0;}
 else{manualC++;}
 manualm(); }
}
 }


void automm(){
 while(portc.b7==1){
 manualC=0; k=3;portc=leds[manualC];
 for(i=23;i>0;i--){
 if(i==20){
 k=20;manualC++; portc=leds[manualC];
 }
 for(j=0;j<50;j++){ if(portc.b7==0){return;}

 rs=i%10; rw=k%10;
 Ls=i/10; Lw=k/10;

 porta.B5=1; portE.B1=1;
 porta.b2=0; portE.B0=0;
 portd=rS; portb=rw<<1;
 Delay_ms(10);

 porta.B5=0; portE.B1=0;
 porta.b2=1; portE.B0=1;
 portd=Ls; portb=Lw<<1;
 Delay_ms(10);
 }
 k--; if(k==0){k=1;}
 }

 k=3; manualC++; portc=leds[manualC];
 for(i=15;i>0;i--){
 if(i==12){k=12;manualC++;portc=leds[manualC];}
 for(j=0;j<50;j++){ if(portc.b7==0){return;}

 rs=k%10; rw=i%10;
 Ls=k/10; Lw=i/10;

 porta.B5=1; portE.B1=1;
 porta.b2=0; portE.B0=0;
 portd=rs; portb=rw<<1;
 Delay_ms(10);

 porta.B5=0; portE.B1=0;
 porta.b2=1; portE.B0=1;
 portd=Ls; portb=Lw<<1;
 Delay_ms(10);

 }
 k--;
 }
}




}
void main() {
TRISB=0b00000001;PORTB=0; GIE_bit=1;
 INTE_BIT=1;
 INTEDG_bit=1;
TRISE=0;PORTE=0;
TRISC=0b10000000;PORTC=0;
TRISA=0b000001;
TRISD=0;PORTD=0;


 while(1){
 if(portc.b7==1){
 automm();}
 else{
manualm();}

}}
