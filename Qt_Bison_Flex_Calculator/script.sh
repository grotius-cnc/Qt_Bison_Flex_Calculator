#!/bin/bash

echo "Your source dir where the .y & .l files are: = $1 "

echo "Compiling .y & .l file's"

# -d flag is used to create new source & header files.
bison -d $1/parser.y
lex -d $1/scanner.l

echo "Done"
