#!/bin/sh

while read user
do
  usermod -s /usr/bin/false ${user}
done < disabledusers.txt

cat /etc/passwd | grep false
