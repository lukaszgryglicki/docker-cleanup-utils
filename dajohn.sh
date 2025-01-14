#!/bin/bash
mkdir dajohn
for f in $(cat dajohn.txt)
do
  echo "$f"
  docker pull "dajohn/$f"
  docker save "dajohn/$f" -o "dajohn-${f}.tar"
  docker image rm "dajohn/$f"
done
