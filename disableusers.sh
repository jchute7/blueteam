#!/bin/sh

while read user
do
  usermod -s /usr/bin/false ${user}
﻿done < users.txt

cat /etc/passwd | grep false
