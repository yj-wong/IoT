CC=gcc
CFLAGS=-lWarn -pedantic
LDFLAGS=lwiringPi

tester: tester.o libmyifttt.a
	$(CC) tester.o -L. -lmyifttt -lcurl -o tester	

irtester: irtester.c 
	$(CC) $(CSFLAGS) $(LDFLAGS)

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o: 	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

tester.o:	tester.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

clean:
	rm tester *.o

