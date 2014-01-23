#! /bin/sh

if [ "$#" -lt 2 ] ; then
  echo "Usage: $0 currentFileName newFileName"
  exit 1
fi

TMP_OUT=`mktemp /tmp/complain.XXX`

echo "Begin rename: $1 to $2"

for dir in include/*; do
  if [ -d "$dir"  ] ; then
    if [ `basename $dir` = "templates" ] ; then
      for file in $dir/*; do
        if [ -f "$file" ] ; then
          echo "rename $1 to $2 in $file"
          sed -e "s/$1/$2/g" $file > $TMP_OUT; cp $TMP_OUT $file
        fi
      done
    elif [ -f "$dir/$1" ] ; then
      echo "move $dir/$1 to $dir/$2"
      git mv $dir/$1 $dir/$2 || mv $dir/$1 $dir/$2
    fi
  fi
done

rm $TMP_OUT
