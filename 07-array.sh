#!/bin/bash

# index starts from 0

Fruits=("Apple" "Kiwi" "grapes" "orange") #Array

echo "first fruit is: ${Fruits[0]}"
echo "second fruit is: ${Fruits[1]}"
echo "third fruit is: ${Fruits[2]}"
echo "fourth fruit is: ${Fruits[3]}"


echo "all fruits is: ${Fruits[@]}"