#!/bin/bash
# Writer script for assignement 1
# Author: Ahmaro

THISFILENAME=${0##*/}
declare -i NUMFILES=0

FILETOWRITE=""
STRTOWRITE=""
FILESARR=""

echo "This file name is ${THISFILENAME}"

if [ $# -lt 2 ]
then
	echo "Number of arguments is not correct. Exiting."
	exit 1
else
	FILETOWRITE=$1
	if [ ! -d ${FILETOWRITE} ]
	then
		CHECKDIR=$(dirname "$FILETOWRITE")
		mkdir -p $CHECKDIR
	fi
	STRTOWRITE=$2
	echo "The given string to write is ${STRTOWRITE}"
fi

echo "${STRTOWRITE}" > $FILETOWRITE
echo "Writing is done!"
exit 0