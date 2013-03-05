#!/bin/bash

while getopts ":a:" opt
do
    case $opt in
    a)
        echo "-$opt was called, Param: $OPTARG" >&2
        ;;
    \?)
        echo "Invalid option -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument" >&2
        exit 1
        ;;
    esac
done
