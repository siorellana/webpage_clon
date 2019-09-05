#!/bin/bash

git config --global user.email sebastianorellanasalazar@gmail.com

git config --global user.name jenkins-ci

git remote remove origin

git remote add origin https://github.com/siorellana/test_clone.git

git add .

git commit -m "Initial commit bla bla"

git push -u origin master

echo "clonado"