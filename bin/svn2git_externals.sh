#!/bin/bash

# in stdin takes svn externals file and checks out the directories and updates .gitignore

while read LINE; do
  DIR=`echo $LINE | cut -f 1 -d " "`
  SVN=`echo $LINE | cut -f 2- -d " "`
  svn co $SVN $DIR
  if [ -z "`grep $DIR .gitignore`" ]; then
    echo $DIR >> .gitignore
  fi
done
