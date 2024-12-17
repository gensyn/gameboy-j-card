#!/bin/bash

for dir in ./*/
do
  if [ -f "${dir}j-card.xcf" ]
  then
    echo "${dir}j-card.xcf exists. Skipping."
    continue
  fi

  system=$(sed '1q;d' "${dir}settings.txt")
  backgroundRed=$(sed '2q;d' "${dir}settings.txt")
  backgroundGreen=$(sed '3q;d' "${dir}settings.txt")
  backgroundBlue=$(sed '4q;d' "${dir}settings.txt")

  echo "Generating ${dir}j-card.xcf."
  gimp -i -b "(fill-template \"template.xcf\" \"$dir\"  \"$system\" $backgroundRed $backgroundGreen $backgroundBlue)" > /dev/null
done
