#!/bin/bash
# Bingo Number Generator
echo -e "\n~~ Bingo Number Generator ~~\n"

NUMBER=$(( RANDOM % 75 + 1 ))
TEXT="The next number is, "
if (( NUMBER <= 15 )) # (( )) do not require $ prepended to variable and use symbolic operators
then
  echo The next number is, B:$NUMBER
elif [[ $NUMBER -le 30 ]] # [[ ]] require $ prepended to variable and text-type operators
then
  echo The next number is, I:$NUMBER
elif (( NUMBER < 46 ))
then
  echo $TEXT N:$NUMBER
elif [[ $NUMBER -lt 61 ]]
then
  echo $TEXT G:$NUMBER
else
  echo $TEXT O:$NUMBER
fi
