#!/bin/bash
# Finder script for assignement 1
# Author: Ahmaro

THISFILENAME=${0##*/}
declare -i NUMFILES=0
declare -i TOTALOCCURANCES=0

FILESDIR=""
SEARCHSTR=""
FILESARR=""

echo "This file name is ${THISFILENAME}"

if [ $# -lt 2 ]
then
	echo "Number of arguments is not correct. Exiting."
	exit 1
else
	FILESDIR=$1
	if [ ! -d ${FILESDIR} ]
	then
		echo "The given directory does not exist."
		exit 1
	else
		echo "The given search directory ${FILESDIR} - is valid."
	fi
	SEARCHSTR=$2
	echo "The given search string is ${SEARCHSTR}"
fi


declare -a var=$(find ${FILESDIR} -type f)

FILES=($(echo $var | tr " " "\n"))

# Get the number of the files found that directory and check it
NUMFILES=${#FILES[@]}
if (($NUMFILES == 0))
    then
        echo "No files are found in given directory. Exiting."
        exit 0
fi

# Search through the files
for FILE in "${FILES[@]}"
do
	NOWOCCURANCES=0
    echo "Searching of ${SEARCHSTR} in file: ${FILE}"
	NOWOCCURANCES=$(grep -o ${SEARCHSTR} ${FILE} | wc -l)
	echo "${NOWOCCURANCES} matches are found."
	TOTALOCCURANCES+=${NOWOCCURANCES}
done

echo "Searching is done."
MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${TOTALOCCURANCES}"
echo ${MATCHSTR}

exit 0