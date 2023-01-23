#!/bin/bash

cat list | grep -P "^https:/" | httpx -ports 443 -nc -silent -sc -location -title -ip | tee    /tmp/list.info.txt
cat list | grep -P "^http:/"  | httpx -ports 80  -nc -silent -sc -location -title -ip | tee -a /tmp/list.info.txt

rm list.info.txt
sort /tmp/list.info.txt > list.info.txt

