#!/bin/bash
echo "Welcome to the script!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "Your version is:" $version

echo "Do you wish to exit the script to chage the version? If yes, input 1. If no, input 0."
read versioncontinue
if [ $versioncontinue ]
then
  for filename in source/*
  do
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo "Not copying " $filename
    else
      echo "Copying " $filename
      cp $filename build/.
    fi
  done

  cd build/
  echo "Build version $version contains:"
  ls
  cd ..
else
  echo "Please come back when you are ready."
fi