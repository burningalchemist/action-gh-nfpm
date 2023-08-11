#!/bin/sh -l

if [ "$INPUT_CONFIG" != "" ] && [ "$INPUT_PACKAGER" != "" ]; then
    if [ "$INPUT_TARGET" != "" ]; then
        name=$(nfpm pkg -f $INPUT_CONFIG -p $INPUT_PACKAGER -t $INPUT_TARGET | grep "created package:" | sed 's|created package: ||g')
    else
        name=$(nfpm pkg -f $INPUT_CONFIG -p $INPUT_PACKAGER | grep "created package:" | sed 's|created package: ||g')
    fi
    if [ "$name" = "" ]; then
        exit 1
    fi
   echo "package=$name" >> $GITHUB_OUTPUT
fi
