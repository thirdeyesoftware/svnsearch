#!/bin/bash
keywordsfile="/Users/jsb8516/projects/svnsearch/pricing_keywords"
keywords=`cat $keywordsfile`

for dir in */; do
#	echo "$dir"
	for keyword in $keywords; do
#		echo "checking $keyword in $dir ..."
		output=$(eval "grep -inrl $keyword $dir/*") 
		if [ "$output" ]; then
#			echo "$keyword"
			for hit in $output; do
				echo "$dir,$keyword,$hit"
			done
		fi
	done
done

