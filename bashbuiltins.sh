#!/bin/bash
# this shebang indicates that this program will be run by /bin/bash

#returns shell environmental variable (default shell)
which $SHELL
echo $SHELL

# allows bash shell customization and configuration
~/.bashrc
~/.bash_profile

#variables
VARIABLE="this is a variable"
echo $VARIABLE

variabletwo="this is also a variable"
echo $variabletwo

# bash manual page, comprehensive technical reference for GNU BASH
man bash

#drop into a bash shell
bash

#check the type of a file
file ./firstscript.sh

# multi-line comment
: << COMMENT
here is a multi line comment.
this uses a here-doc to redirect all lines to the no-op command 
COMMENT
#Bash Built-ins

#check if a command is a bash built-in
type let

#view a full list of bash built-ins
compgen -b

# bash built-ins do not require a new process to run the command 
declare # allows you to give attributes to variables
#example:
#create a variable named variable
declare variable="Brendan"

#create an int variable 
declare -i myinteger=9
declare -i newnumber=myinteger+myinteger

#create an array
declare -a fruits=("Apple" "Banana" "Orange")

#view the types, attributes, and values of a variable
declare -p fruits

#echo with interpretting backslash escape sequences
\n # newline
\t # new tab
\\ # literal backslash
\r # carraige return (move to beginning of current line)
#ex:

echo -e "Hello \n World!"
echo -e "Hello \r World"

#arithmetic evaluation with let

let x=5+3
echo $xS
let x--
echo $x
let x*=3
echo $x
let x+=10
echo $x

#arithmetic operators
+, -, *, /, %

#modern arithmetic evaluation
(( x = 5 + 3))

# create a local variable that exists only within the current function
my_function() {
    #global variable
    name="Brendan"

    #local variable (local scope)
    local name="Bren"

}
# read input from stdin and store it in a variable called name
read name

#add a prompt
read -p "Enter your name: " name
echo "Hello, $name"

# hide the input (silent input)
read -s password 

#read multiple variables
read first last

# determine how a command is interpreted
type [command]

# will tell you if a command is a builtin, an alias, external, etc
type ls

# tell the current shell to read and execute commands from a file
source file.sh

#after running source file.sh, the variables from that script become 
#available in the current shell
#since a script runs in a seperate child process, its variables will
# not usually persist to your session after it is run

#example
source ~/.bashrc

#the difference between running a script with source vs. ./file.sh is that
# source will run it in the current terminal session

#pass variables and functions to child processes
#make a shell variable available to programs/processes launched from this shell
export name="Brendan"

#view environmental variables
env

#grep environmental variables for the exported variable name
env | grep name

# to make a variable global, add it to the PATH

#echo is both built-in and external 
type -a echo

#man pages are used for getting help for external commands
man echo

#help pages are used for getting help fo built-ins
help echo

#PATH
# the $PATH environmental variable is a colon-seperated list of directories
# that tells your shell where to look for executable programs when you type a command

#view your current path:
echo $PATH

# add a new folder to PATH for this session
PATH=$PATH:~/scripts

# to add a folder to PATH persistently, add the above line to .bashrc file