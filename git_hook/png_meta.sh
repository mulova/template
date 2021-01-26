#!/bin/sh
echo "removing PNG Meta..."

git diff --cached --name-status --diff-filter=ACM | while read st file; do
        # do a check only on the perl files
        if [[ "$file" =~ .*\.png$ ]] ; then
		echo "Stripping png meta $file"
		git_hook/exiftool/exiftool -r -overwrite_original -XMP-photoshop:DocumentAncestors= "$file"
        fi
done
