#include <stdio.h>
#include <wiringPi.h>
#include "ifttt.h"

int main(int argc, char *argv[])
{
  wiringPiSetup () ;
  pinMode(0, INPUT);
  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);

  while(1) {
    /*printf("Waiting for reset\n");*/
    while(digitalRead(0) == 0) {
      /*printf("Waiting for event\n");*/
      digitalWrite(2, LOW);
      digitalWrite(1, HIGH);
    }
   if(digitalRead(0) == 1) {
      printf("Alarm\n");
      digitalWrite(1, LOW);
      digitalWrite(2, HIGH);
      ifttt("http://red.eecs.yorku.ca:8080/trigger/event/with/key/123", "my1", "my 2", "my 33333");
      delay(0);
    }
  }
  /*NOTREACHED*/
  return 0 ;
}
