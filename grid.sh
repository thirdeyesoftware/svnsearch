#!/bin/bash
keywordsfile="/Users/jsb8516/projects/grid/keywords"
keywords=`cat $keywordsfile`

for dir in */; do
	echo "$dir"
	for keyword in $keywords; do
		output=$(eval "grep -inrl $keyword $dir/src/* | wc -l | xargs") 
		if [ $output -ne 0 ]
		then
#			echo "   $keyword hit"
			echo "   $keyword ($output)"
		fi
	done
done

