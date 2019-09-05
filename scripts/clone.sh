#!/bin/bash
now=$(date +"%T")

git remote -v

git remote remove origin

rm -rf .git

git init

git remote add origin https://github.com/siorellana/test_clone.git

echo "Current time : $now" >> timestamp.out

git add .

#git commit -am 'Initial commit bla bla'

git push -u origin master --force-with-lease

cat timestamp.log

echo "clonado"