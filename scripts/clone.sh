#!/bin/bash

git remote remove origin

git remote add origin https://github.com/siorellana/test_clone.git

git add .

git commit -m "Initial commit bla bla"

git push -u origin master

echo "clonado"