#!/bin/bash

for (( i=1; i <= `wc -l < usChannels.txt`; i++ ))
do
  currLine=`head -n "$i" usChannels.txt | tail -1`
  category=$(awk -F ',' '{print $5}' <<< "$currLine")

  if [ "$category" = "Music" ]
  then
    echo $currLine >> ./UnitedStates/Music.txt
  elif [ "$category" = "Entertainment" ]
  then
    echo $currLine >> ./UnitedStates/Entertainment.txt
  elif [ "$category" = "Gaming" ]
  then
    echo $currLine >> ./UnitedStates/Gaming.txt
  elif [ "$category" = "Comedy" ]
  then
    echo $currLine >> ./UnitedStates/Comedy.txt
  fi
done
