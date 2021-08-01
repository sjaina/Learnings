#!/usr/bin/env bash
date

$c=$(date +%F)

echo $c

echo "File is running"

v=(10 20 30 )

echo ${v[*]}

echo course name = ${COURSE}

read -p 'Enter a name:' name

echo "Entered name is : $name"