#!/bin/bash
now=$(date +"%T")
$token="b0ad5f1ff548773256d27c136907a0b4bc3e3d3a"


git remote -v

git remote remove origin

rm -rf .git

git init

git remote add origin https://siorellana:b0ad5f1ff548773256d27c136907a0b4bc3e3d3a@github.com/siorellana/test_clone.git

echo "Current time : $now" >> timestamp.out

git add .

git commit -am "$(curl -s whatthecommit.com | grep '<p>' | cut -c 4-)"

git push -u origin master --force

cat timestamp.log

echo "clonado"