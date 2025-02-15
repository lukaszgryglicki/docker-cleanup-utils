#!/bin/bash
if [ -z "$1" ]
then
  echo "You need to provide path as first arument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "You need to provide file name pattern as a second argument"
  exit 1
fi
if [ -z "$3" ]
then
  echo "You need to provide regexp pattern to search for as a third argument"
  exit 1
fi
find "$1" -type f -iname "$2" -not -path './dist/*' -not -path '*./node_modules/*' -not -name "out" -not -path '*./.git/*' -exec grep -EHIin "$3" "{}" \; | tee -a out
