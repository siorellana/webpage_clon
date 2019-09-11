#!/bin/bash
now=$(date +"%T")

git clone --bare https://gitlab.com/siorellana/siorellana.git

cd siorellana

git push --mirror https://${USER}:${PASS}@github.com/siorellana/test_clone.git

cd ..

rm -rf siorellana/

echo "clonado"