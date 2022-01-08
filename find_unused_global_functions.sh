#!/bin/bash

# Script to find global functions in C files that can be converted to
# file-local static functions (used only locally within the file).
#
# Relies on universal or exuberant ctags to get the list of functions.

CTAGS=ctags

if [ $# -lt 1 ]
then
    echo "Usage: $(basename $0) <filename(s)>"
    exit 1
fi

if [ ! -f $1 ]
then
    echo "Error: File $1 is not found"
    exit 1
fi

echo "Analyzing global functions in file $1"

FNAME=$1
for fn in $(${CTAGS} -f - --kinds-c=f --extras=-F ${FNAME} | cut -f1)
do
    count=$(grep -l $fn *.[ch] | wc -l)
    if [ $count -le 1 ]
    then
	echo "$fn: $count"
    fi
done
