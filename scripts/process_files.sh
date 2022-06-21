#!/bin/sh

# Note: this directory should be a subdirectory of a directory that has all C-Ware projects as subdirectories.
# In other words, like this:
# 
# rootDirectory
#       |
#       \____ chash
#       \____ cstring
#       \____ ....
#       \____ cware-manuals

cp ../../*/doc/* .
for f in *.cware; do groff -Thtml -man $f > $f.temp1; done
for f in *.temp1; do grep -v ".png" $f > $f.temp2; done
for f in *.temp2; do newname=`echo $f | cut -f1 -d .`; echo $newname; mv $f $newname.html; done
rm *.cware *.temp1 *.png
