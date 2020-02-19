#!/bin/bash -x

#TAKE INPUT FROM USER
read -p "Enter The Number Of Times Coin Flip: " number
echo "1.Singlet"
echo "2.Doublet"
read -p "Enter Your Choice:" choice

#DECLARTION OF DICTIONARY
declare -A flipCoin

#CONSTANT
ISFLIP=1
SINGLET=1
DOUBLET=2

#FLIP A COIN AND CHECK HEAD OR TAIL
function getflip
{
	for (( index1=0; index1<$number; index1++ ))
	do
		for (( index2=0; index2<$choice; index2++ ))
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
		fi
		coinSide=""
	done
}

#PRINT COUNT OF ALL COMBINATION
echo ${flipCoin[@]}

#CALCULATE THE PERCENTAGE OF COMBINATION
function getPercentage
{
	for index in ${!flipCoin[@]}
	do
		flipCoin[$index]=`echo "scale=2; ${flipCoin[$index]}*100/$number" | bc`
	done
	echo ${flipCoin[@]}
}

#FUNCTION CALL
case $choice in
	$SINGLET)
		getflip
		getPercentage
		;;
	$DOUBLET)
		getflip
		getPercentage
		;;
	*)
		echo "Invalid choice:"
		;;
esac
