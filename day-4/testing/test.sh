#/usr/bin/bash

# Step 1: diff against gold files
gf --run < unittests/decl.gfs | diff -u - unittests/decl.gfs.GOLD

gf --run < unittests/command.gfs | diff -u - unittests/command.gfs.GOLD

gf --run < unittests/question.gfs | diff -u - unittests/question.gfs.GOLD

echo "If this is the first line you see, it means success!"

# Step 2 if you are fancy: output the linearisations of the test trees
if [ $# -eq 0 ]
then
    echo ""
else
    echo "Declarative sentences"
    gf --run < unittests/decl.gfs

    echo ""
    echo "------"
    echo ""
    echo "Questions"
    gf --run < unittests/question.gfs

    echo ""
    echo "------"
    echo ""
    echo "Commands"
    gf --run < unittests/command.gfs
fi