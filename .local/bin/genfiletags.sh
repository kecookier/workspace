#!/bin/sh

if [ $# -lt 1 ]; then
    echo "Usage: genfiletags.sh [dst_dir]"
    exit 0
fi

cd $1
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > ./filenametags
find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | sort -f >> ./filenametags
