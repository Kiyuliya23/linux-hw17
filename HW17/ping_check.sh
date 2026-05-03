#!/bin/bash

read -p "Введите адрес для ping:" address
 

fail_count=0
 

 while true
 do
  ping -n 1 $address > ping_result.txt 2>&1
 

    if [ $? -ne 0 ]; then
     ((fail_count++))
      echo "Ping не выполнен ($fail_count)"
     else
   
   # вытаскиваем время ping 
    time_ms=$(grep "time=" ping_result.txt | awk -F'time=' '{print $2}' | awk '{print $1}')
   
   if [ -n "$time_ms" ]; then
    time_int=$(echo $time_ms | sed 's/ms//')

    if [ "$time_int" -gt 100 ]; then
      echo "Большая задержка: ${time_ms}"
  fi
 fi
  fi 
  if [ "$fail_count" -ge 3 ]; then
  echo "Ping не удалось 3 раза подряд"
  fail_count=0
 fi
  sleep 1
 done 

  
