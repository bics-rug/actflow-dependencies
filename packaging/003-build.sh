#!/bin/bash

if [ -d "../packaging" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi

if [ x$ACT_HOME = x ]
then
	echo "Please set the environment variable ACT_HOME to the install directory"
        exit 1
fi

if [ x$EDA_SRC = x ]
then
	export EDA_SRC=$(pwd)/src
fi

bash ./build
