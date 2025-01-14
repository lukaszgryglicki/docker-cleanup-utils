#!/bin/bash
for d in site-packages dist-packages python3.7 python3.6 python3.5 python3 python2.7 node_modules zoneinfo terminfo perl5 perl vim include locale locales i18n gems postgresql yumdb lib64 lib-exec libexec ca-certificates x86_64-linux-gnu aarch64-linux-gnu 2.6.0 ruby .cache pip git-core doc .git
do
  find . -type d -iname "$d" -exec rm -rf "{}" \;
done

for d in dockerd docker aws-iam-authenticator skaffold containerd kubectl node dads main cc1plus 
do
  find . -type f -iname "$d" -exec rm -f "{}" \;
done

find . -type f -iname "*.so.*" -exec rm -f "{}" \;
find . -type f -iname "*.so" -exec rm -f "{}" \;
find . -type f -iname "*.o" -exec rm -f "{}" \;
find . -type f -iname "*.a" -exec rm -f "{}" \;
find . -type f -iname "*.vim" -exec rm -f "{}" \;
find . -type f -iname "*.bz2" -exec rm -f "{}" \;
find . -type f -iname "*.zip" -exec rm -f "{}" \;
find . -type f -iname "*.l4z" -exec rm -f "{}" \;

for f in $(find . -type f)
do
  ft=$(file $f)
  ft="${ft/$f: /}"
  case "$ft" in
    *"ELF 64-bit LSB shared object"*)
      echo "removing shared object $f"
      rm -f "$f";;
    *"ELF 64-bit LSB executable"*)
      echo "removing executable $f"
      rm -f "$f";;
    *"gzip compressed data"*)
      echo "removing gzip compressed data $f"
      rm -f "$f";;
    *"(python "*" byte-compiled)"*)
      echo "removing python byte compiled $f"
      rm -f "$f";;
    *)
      # echo "not touching $f ($ft)"
      ;;
  esac
done
