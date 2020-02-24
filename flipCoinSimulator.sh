#!/bin/bash

#CONSTANT
ISFLIP=1
SINGLET=1
DOUBLET=2
TRIPLET=3

#DECLARTION OF DICTIONARY
declare -A flipCoin

#TAKE INPUT FROM USER
read -p "Enter The Number Of Times Coin Flip: " number
echo "1.Singlet"
echo "2.Doublet"
echo "3.Triplet"
read -p "Enter Your Choice:" choice

#FLIP A COIN AND CHECK HEAD OR TAIL
function getflip()
{
	local NUMBER_OF_COIN=$1
	for(( index1=0; index1<$number; index1++ ))
	do
		for(( index2=0; index2<$NUMBER_OF_COIN; index2++ ))
		do
			randomCheck=$((RANDOM%2))
			if [ $randomCheck -eq $ISFLIP ]
			then
				coinSide+="H"
			else
				coinSide+="T"
			fi
		done
		((flipCoin[$coinSide]++))
		coinSide=""
	done
}

#FUNCTION TO FIND PERCENTAGE
function getPercentage()
{
	for index in ${!flipCoin[@]}
	do
		flipCoin[$index]=`echo "scale=2; ${flipCoin[$index]}*100/$number" | bc`
	done
	echo ${flipCoin[@]}
}

#SORT THE DICTIONARY AND FIND MAXIMUM WINNING COMBINATION
function sorting()
{
	for k in ${!flipCoin[@]}
	do
		echo $k '-' ${flipCoin[$k]}
	done |  sort -rn -k3 | head -1
}

#FUNCTION CALL
case $choice in
	$SINGLET)
		getflip $choice
		getPercentage ${flipCoin[@]}
		sorting ${flipCoin[@]}
		;;
	$DOUBLET)
		getflip $choice
		getPercentage ${flipCoin[@]}
		sorting ${flipCoin[@]}
		;;
	$TRIPLET)
		getflip $choice
		getPercentage ${flipCoin[@]}
		sorting ${flipCoin[@]}
		;;
	*)
		echo "Invalid choice:"
		;;
esac
