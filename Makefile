CC=gcc
CFLAGS=-lWarn -pedantic
LDFLAGS=-lmyifttt -lcurl -lwiringPi

tester: tester.o libmyifttt.a
	$(CC) tester.o -L. -lmyifttt -lcurl -o tester	

alarm: alarm.o libmyifttt.a
	$(CC) alarm.o -L. $(LDFLAGS) -o alarm

alarm.o: alarm.c ifttt.h
	$(CC) $(CSFLAGS) $(LDFLAGS) -c -ansi $<

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o: 	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

tester.o:	tester.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

irtester: irtester.c
	 $(CC) $(CSFLAGS) -lwiringPi -o irtester -ansi $<

clean:
	rm tester *.o

all: tester alarm irtester
