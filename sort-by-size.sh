#!/bin/bash
find . -type f -exec ls -l "{}" \; > ../out
cat ../out | sort -k5 -n -r > out
vim out
