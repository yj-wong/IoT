#include <stdio.h>
#include <wiringPi.h>
int main(int argc, char *argv[])
{
  wiringPiSetup () ;
  pinMode(0, INPUT);
  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);

  while(1) {
    printf("Waiting for reset\n");
    if(digitalRead(0) == 1) {
      printf("Waiting for event\n");
      digitalWrite(2, 0);
      digitalWrite(1, 1);
    }
    else if(digitalRead(0) == 0) {
      printf("Alarm\n");
      digitalWrite(1, 0);
      digitalWrite(2, 1);
    }
  }
  /*NOTREACHED*/
  return 0 ;
}
