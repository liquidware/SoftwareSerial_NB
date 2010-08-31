/****************************
* TouchShieldLink
* An example sketch for the Arduino that reads the 
* Liquidware TouchShield - http://www.liquidware.com/shop/show/TSL/TouchShield+Slide
* on pins 2 and 3 and forwards the message to the PC
*
*****************************/

#include <SoftwareSerial_NB.h>

#define RX_PIN 3
#define TX_PIN 2

#define BUFF_SIZE 64

SoftwareSerial_NB mySerial = SoftwareSerial_NB(RX_PIN, TX_PIN);

void setup() {
   mySerial.begin(9600);  //Open TouchShield connection
   Serial.begin(9600);    //Open PC connection
}

char msg[BUFF_SIZE];
int c;
int index;

void loop() {

   mySerial.print("Hi TouchShield");
  
   /* Reset everything */
   index = 0;
   memset(&msg[0], 0, BUFF_SIZE);

   /* Read serial messages */
   while (1) {                       
      c = mySerial.read();
      if (c == -1) {
         break;         // No more messages found, break out of the loop 
      }
      msg[index] = c;
      index++;
   }
   
   /* Did a message arrive? */
   if (index) {

      /* Forward to the PC 
         and maybe do other stuff */
      Serial.print(msg);   
   }
}
