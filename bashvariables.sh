#!/bin/bash

# bash variables can be int or string, and are assumed to be string by default 
#create a string variable 
x=5
y=2
z=$x+$y

#view contents of a variable
echo $z

# declare an int variable
let x=4

#more modern way to declare an int variable
((z = x + y))

#How to statically declare an int variable (Can't be changed to a string after)
declare -i z=$x+$y
echo $z

# statically declare a string variable
declare +i z="hello world"
#note quotes are required here to capture the entire string


#calling a variable without quotations might remove spaces
# Bash expands the variable, then performs word splitting on spaces, tabs, and newlines.
echo $z

#calling a variable with quotations will preserve spaces
# Bash expands the variable but preserves its contents as a single argument.
echo "$z"

