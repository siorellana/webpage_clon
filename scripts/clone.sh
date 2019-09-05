#!/bin/bash

git remote -v

git remote remove origin

git remote add origin https://github.com/siorellana/test_clone.git

echo "Current time : $now" >> timestamp.log

git add .

git commit -am 'Initial commit bla bla'

git push -u origin master

cat timestamp.log

echo "clonado"