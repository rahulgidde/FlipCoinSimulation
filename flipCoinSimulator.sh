#!/bin/bash

#TAKE INPUT FROM USER
read -p "Enter The Number Of Times Coin Flip: " number
echo "1.Singlet"
echo "2.Doublet"
echo "3.Triplet"
read -p "Enter Your Choice:" choice

#DECLARTION OF DICTIONARY
declare -A flipCoin

#CONSTANT
ISFLIP=1
SINGLET=1
DOUBLET=2
TRIPLET=3

#FLIP A COIN AND CHECK HEAD OR TAIL
function getflip
{
	for(( index1=0; index1<$number; index1++ ))
	do
		for(( index2=0; index2<$choice; index2++ ))
		do
			randomcheck=$((RANDOM%2))
			if [ $randomcheck -eq $ISFLIP ]
			then
				coinSide+="H"
			else
				coinSide+="T"
			fi
		done
		if [ $choice -eq $SINGLET ]
		then
			((flipCoin[$coinSide]++))
		elif [ $choice -eq $DOUBLET ]
		then
			((flipCoin[$coinSide]++))
		elif [ $choice -eq $TRIPLET ]
		then
			((flipCoin[$coinSide]++))
		fi
		coinSide=""
	done
}

#FUNCTION TO FIND PERCENTAGE
function getPercentage
{
	for index in ${!flipCoin[@]}
	do
		flipCoin[$index]=`echo "scale=2; ${flipCoin[$index]}*100/$number" | bc`
	done
	echo ${flipCoin[@]}
}

#SORT THE DICTIONARY AND FIND MAXIMUM WINNING COMBINATION
function sorting
{
	for k in ${!flipCoin[@]}
	do
		echo $k '-' ${flipCoin[$k]}
	done |  sort -rn -k3 | head -1
}

#FUNCTION CALL
case $choice in
	$SINGLET)
		getflip
		getPercentage
		sorting
		;;
	$DOUBLET)
		getflip
		getPercentage
		sorting
		;;
	$TRIPLET)
		getflip
		getPercentage
		sorting
		;;
	*)
		echo "Invalid choice:"
		;;
esac
