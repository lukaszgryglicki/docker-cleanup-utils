> ../check.log.secret
for s in $(cat ./leaked.secret)
do
  echo "checking for $s"
  echo "checking for $s" >> ../check.log.secret
  find.sh . '*' "$s" > result.secret
  cat result.secret >> ../check.log.secret
done
rm result.secret
mv ../check.log.secret .
vim check.log.secret
