dir1=$1
dir2=$2

dir1filelist=$(find $dir1 -name "*.sql" -type f -exec basename {} \; | egrep -v "schema-create" | cut -f2- -d'.' | sort)
dir2filelist=$(find $dir1 -name "*.sql" -type f -exec basename {} \; | egrep -v "schema-create" | cut -f2- -d'.' | sort)

if [ "$(echo "$dir1filelist" | md5sum)" != "$(echo "$dir2filelist" | md5sum)" ]
then
	exit 1
fi

for file in $dir1filelist
do
	cmp ${dir1}/*.$file ${dir2}/*.$file
	error=$?
	if (( $error != 0 ))
	then
		exit 1;
	fi
done
