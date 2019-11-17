#!/bin/bash
for nb in analysis/*.ipynb
do
    jupyter nbconvert --to HTML $nb
done
git add .
git commit -m "$1"
git push

