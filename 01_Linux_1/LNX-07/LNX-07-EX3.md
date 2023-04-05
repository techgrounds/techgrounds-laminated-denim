	#! /usr/bin/bash
	
	RANDOMN=$((RANDOM%10+1))
	if [ $RANDOMN -gt 5 ]
	then
		echo $RANDOMN >> greaterthan5
	elif [ $RANDOMN -lt 5]
	then
		echo $RANDOMN >> lessthan5
	fi