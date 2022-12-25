#!/bin/bash

cat list | httpx -nc -silent -sc -location -title -ip | tee list.info.txt