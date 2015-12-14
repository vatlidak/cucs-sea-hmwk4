CC := gcc
CFLAGS := -w -fPIC -shared -rdynamic
LDFLAGS := -ldl -lrt

LIB := interpose.so
SRC := ./src/interpose.c
BIN := /home/w4187/hw4_bin/pretend-hw
TEST := ./smb-secret_NOT.txt
HIDDEN_OPTIONS := -d

build:
	$(CC) $(CFLAGS) -o $(LIB) $(SRC) $(LDFLAGS)

exec: clean build
	echo "test" > ${TEST}
	LD_PRELOAD=./$(LIB) $(BIN) ${TEST} ${HIDDEN_OPTIONS}
	@echo ""
	@echo ""
	@echo ""
	ls /home/w4187/.fake-submit/octIrvad/smb-secret_NOT.txt
	@rm ${TEST}
	@rm /home/w4187/.fake-submit/octIrvad/smb-secret_NOT.txt

clean:
	rm -f $(LIB)
