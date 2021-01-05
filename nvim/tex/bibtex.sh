#!/bin/bash

file=$1
aux=$2

if ls *.bib >/dev/null 2>&1;then
	xelatex ${file} && bibtex ${aux} && xelatex ${file} && xelatex ${file}
else
	xelatex ${file} && xelatex ${file}
fi
