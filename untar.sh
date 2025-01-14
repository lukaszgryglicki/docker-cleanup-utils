#!/bin/bash
cd=$(realpath .)
for f in *.tar
do
    echo "image $f"
    d="${f/.tar/}"
    if [ ! -d "$d" ]
    then
      echo "extracting $f into $d"
      mkdir "$d"
      tar xf "$f" -C "$d" && rm -f "$f"
    else
      echo "$f is already extracted into $d"
    fi
    cd "$d/blobs/sha256/"
    for i in *
    do
      ty=$(file "$i")
      ty="${ty/$i: /}"
      if [ "$ty" = "POSIX tar archive" ]
      then
        echo "$i type is '$ty'"
        l="${i}.fs"
        if [ ! -d "$l" ]
        then
          echo "extracting $d layer $l"
          mkdir "$l"
          tar xf "$i" -C "$l" && rm -f "$i"
        else
          echo "$d layer $l already extracted"
        fi
      fi
    done
    cd "$cd"
done
