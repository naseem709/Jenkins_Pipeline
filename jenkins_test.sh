#!/bin/bash
saveIFS=$IFS
IFS=$' '
USAGE=( $( sar | tail -1 | cut -c20-29,40-49 ) )
IFS=$saveIFS
SUM=0
for (( CNTR=0; CNTR<${#USAGE[@]}; CNTR+=1 )); do
    FLOAT=( $( echo ${USAGE[$CNTR]} | tr ',' '.' ) )
    SUM=( $( echo "$SUM+$FLOAT" |bc  ) )
done
INT=${SUM/.*}
echo $INT
if [[ $INT == "" ]]; then
    INT=0
fi
