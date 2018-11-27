#!/bin/sh

DAO_PATH="https://svn.homedepot.com/svn/InformationServices/EnterpriseArchitecture/DAO/DAO_LIBRARIES"
dirs=`svn list "$DAO_PATH"`
for dir in $dirs; do
	echo "$dir"
	repo=`svn list "$DAO_PATH"/$dir`
	echo "repo=$repo"
	if [[ $repo == *"trunk"* ]]; then
		echo "trunk exists for $dir"
 		resp=`svn co "$DAO_PATH"/$dir/trunk $dir`
	else
		echo "no trunk for $dir"
 		resp=`svn co "$DAO_PATH"/$dir $dir`
	fi
done

