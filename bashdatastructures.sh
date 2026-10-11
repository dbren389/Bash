#!/bin/bash

#bash uses zero-based arrays

#create an empty array
declare -a myarray

#create an array without declare
myarray=("dog" "cat" "man") 

#expand all elements of array
echo "${myarray[@]}"

#retrieve the first element of an array
echo $myarray

#use indexing to to pull string string out of the array
echo "${myarray[0]}"

#output the number of values stored in the array
echo "${#myarray[@]}"

# to edit the value by index
myarray[3]="mouse"

# append a value to the end of an array
myarray+="cow"

#delete a specific array element
unset myarray[1]
#after using this, there is no more index 1, there is a hole. The array does not shift to fill in the gap

#expand and combines all values to a single string, instead of individual elements
echo "${myarray[*]}"

#associative arrays / hash tables
#note: for bash associative arrays, we can only return the value given the key, not vice versa 

#create an associative array
declare -A name=([dog]="barks" [cat]="meows" [wolf]="howls")

#pull a value
echo "${name[dog]}"

#display all values
echo "${name[@]}"

#display all keys
echo "${!name[@]}"

#display # of key value pairs
echo "${#name[@]}"

#change the value for a key
name[dog]="woofs"

#append a new key value pair
name+=([cow]="moos")

#delete a specific key value pair
unset name[dog]

#delete an entire array
unset name