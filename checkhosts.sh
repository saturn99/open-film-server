#!/bin/bash

cat list | cut -d , -f 1 | grep -P "^https:/" | httpx -ports 443 -probe -nc -silent -sc -location -title -ip | tee    /tmp/list.info.txt
cat list | cut -d , -f 1 | grep -P "^http:/"  | httpx -ports 80  -probe -nc -silent -sc -location -title -ip | tee -a /tmp/list.info.txt

rm list.info.txt
sort /tmp/list.info.txt > list.info.txt

