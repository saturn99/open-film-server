#!/bin/bash

cat list | grep -P "^https:/" | httpx -ports 443 -nc -silent -sc -location -title -ip | tee    list.info.txt
cat list | grep -P "^http:/"  | httpx -ports 80  -nc -silent -sc -location -title -ip | tee -a list.info.txt