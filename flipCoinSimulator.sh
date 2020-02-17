#!/bin/bash -x

echo "-------------Welcome to Flip Coin Simulation----------"

#GENRATE RANDOM NUMBER
randomcheck=$((RANDOM%2))

#FLIP A COIN AND CHECK HEAD OR TAIL
if [ $randomcheck -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi
