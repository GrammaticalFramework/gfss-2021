#/usr/bin/bash

# Step 1: diff against gold files
gf --run < unittests/conj.gfs | diff -u - unittests/conj.gfs.GOLD

echo "If this is the first line you see, it means success!"

# Step 2 if you are fancy: output the linearisations of the test trees
if [ $# -eq 0 ]
then
    echo ""
else
    echo "\nConjunctions"
    gf --run < unittests/conj.gfs

    # echo ""
    # echo "------"
    # echo ""
    # echo "More tests"
    # gf --run < unittests/<TODO>.gfs

fi