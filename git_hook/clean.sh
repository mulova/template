#! /bin/sh

# Start from the repository root.
#cd ./$(git rev-parse --show-cdup)

# Delete .pyc files
#find . -name "*.pyc" -delete 2>&1 > /dev/null &

# Delete empty directories.
echo "Delete empty directories..."

find ./Assets -type d -empty -print0 |
while IFS= read -r -d '' i;
do
    echo "Remove empty directory " $i
    rmdir "$i"
    rm -f "$i.meta"
done
