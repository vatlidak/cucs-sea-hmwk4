CC := gcc
CFLAGS := -w -fPIC -shared -rdynamic
LDFLAGS := -ldl -lrt

LIB := interpose.so
SRC := ./src/interpose.c
BIN := /home/w4187/hw4_bin/pretend-hw

build:
	$(CC) $(CFLAGS) -o $(LIB) $(SRC) $(LDFLAGS)

exec: clean build
	echo "test" > "test.txt"
	LD_PRELOAD=./$(LIB) $(BIN) ./test.txt
	rm ./test.txt

clean:
	rm -f $(LIB)
