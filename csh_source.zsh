#!/bin/bash
# This should be sourced rather than executed
while read cmd var val
do
    if [[ $cmd == "setenv" ]]
        then
            eval "export $var=$val"
    fi
    if [[ $cmd == "module" ]]
        then
            eval "module $var $val"
    fi
done
