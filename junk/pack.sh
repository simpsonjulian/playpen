#!/bin/bash
# program to produce folded mini books
pdflatex=/usr/bin/pdflatex
infile=”$1″
tmpdir=”/tmp/$$”

cp “$infile” “$tmpdir/in.pdf”
cd “$tmpdir”
# invert pages on top half
$pdflatex \\batchmode \
\usepackage{pdfpages}\