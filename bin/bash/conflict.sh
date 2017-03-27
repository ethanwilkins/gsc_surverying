#!/bin/sh

git stash

git pull origin master -v

git stash pop

git push origin master -v
