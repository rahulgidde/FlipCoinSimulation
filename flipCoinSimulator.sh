#!/bin/bash -x

#TAKE INPUT FROM USER
read -p "Enter The Number Of Times Coin Flip: " number

#DECLARTION OF DICTIONARY
declare -A flipCoin

#CONSTANT
ISFLIP=1
SINGLET=1

#FLIP A COIN AND CHECK HEAD OR TAIL
for (( index1=0; index1<$number; index1++ ))
do
	for (( index2=0; index2<$SINGLET; index2++ ))
	do
		randomcheck=$((RANDOM%2))
		if [ $randomcheck -eq $ISFLIP ]
		then
			coinSide+="H"
		else
			coinSide="T"
		fi
	done
		((flipCoin[$coinSide]++))
		coinSide=""
done

#CALCULATE THE PERCENTAGE OF HEAD AND TAIL
for index in ${!flipCoin[@]}
do
	flipCoin[$index]=`echo "scale=2; ${flipCoin[$index]}*100/$number" | bc`
done

