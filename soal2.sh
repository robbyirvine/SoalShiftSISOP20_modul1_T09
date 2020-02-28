#!/bin/bash

passwor=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
file=$(echo $1 | tr -dc 'a-zA-Z').txt

echo $password > $file.txt
