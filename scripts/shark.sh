#!/bin/bash

BASE_NAME="x"
TEST_FILE="vatlidak-test.txt"
DIR_NAME="/home/w4187/.fake-submit/octIrvad/"
BIN="/home/w4187/hw4_bin/pretend-hw"

echo "test" > $TEST_FILE
export HWBASE=$DIR_NAME

while [ "$?" -eq "0" ]; do
	export HWSECRET+=$BASE_NAME;
	sleep 0.01
	echo "Trying dirname:" $HWSECRET
	mkdir "${DIR_NAME}/${HWSECRET}"
	${BIN} ${TEST_FILE}
	if [ "$?" -ne "0" ]; then
		echo "E: Identified an error -- Parameters:"
		echo "Length:${#HWSECRET}, HWSECRET=$HWSECRET"
		echo "Length:${#HWBASE}, HWSECRET=$HWBASE"
		echo "--------------------------------------"
		break
	fi
	rm -rf  "${DIR_NAME}/${HWSECRET}"
done

rm -rf  "${DIR_NAME}/${HWSECRET}"
rm $TEST_FILE
