#!/bin/bash
# задаем значение переменных по умолчанию
a=`cat /proc/meminfo | grep MemFree | awk '{print $ 2}'`

b=`cat /proc/meminfo | grep MemTotal | awk '{print $ 2}'`
div=`echo "scale=4; $a / $b *100" | bc`
echo "$div"
