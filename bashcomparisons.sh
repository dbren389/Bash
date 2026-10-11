#!/bin/bash

#comparison operators

== # equal to
!= # not equal to
< # less than
> # greater than
=~ # true if a string matches a regular expression 

#special comparisons

-Z # string is null 
-n # string is not null
-f # file exists 
-s # file size is not zero
-d # file is a directory

#get exit status, $? stores the exit status of last command run 
echo $?

# 0 => successful 
# nonzero exit status => error 

#test if a statement is true or false
test 1 == 1

#test shorthand
[ 1 -eq 1 ]

#recomended for integers 
((1 > 2))
echo $?

# extended test
# symbol comparison operators are used to compare strings and letters
[[ "apple" > "bee" ]]
# note: this outputs false, as only the ascii values of the first characters are compared

#comparing regex patterns
[[ "hello" =~ [a-z]{5} ]]

# $BASH_REMATCH is a special read only array that stores the results of the last regex match using the =~ operator
email="dbren@gmail.com"

[[ "$email" =~ (.+)@(.+) ]]

echo "All elements: ${BASH_REMATCH[@]}" #username@domain.com username domain.com
echo "Full Match: ${BASH_REMATCH[0]}" #username@domain.com
echo "Username: ${BASH_REMATCH[1]}" #username, first captured group 
echo "Domain: ${BASH_REMATCH[2]}" # domain.com, second captured group

#wildcard comparison 
[[ "hello" =~ * ]]

#if statements
declare -i x=1

if (( x == 1 )); then
    echo "x is one"
elif (( x < 1 )); then
    echo "x is less than one"
elif (( x > 1 )); then
    echo "x is greater than one"
else
    echo "this should not be possible"
fi

# string comparison example
x="hello"

if [[ "$x" =~ [a-z]{5} ]]; then
    echo "pattern matches"
else
    echo "pattern does not match"
fi

if [[ "$x" == "hello" ]]; then
    echo "x is set to hello"
else
    echo "x is not set to hello"
fi

if [[ "$x" == ?[aeiou]?* ]]; then
    echo "x has a character, than a vowel, than another character, followed by anything else"
else
    echo "x does not match the shell pattern"
fi

#check if a file exists 
if [[ -f somefile ]]; then
    echo "file found"
else
    touch somefile
fi

#read can be used to read user input 
read -rp "Please pick a color"

#case statements are used to avoid redundant elifs 
read -rp "Please pick a color"

case "$color" in 

    blue)
        echo "The sky is blue"
         ;;
    green)
        echo "The grass is green"
        ;;
    red)
        echo "red is the color of passion"
        ;;
    *)
        echo "I like that color too"
        ;;
esac 