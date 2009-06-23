#!/bin/bash
# program to produce folded mini books
pdflatex=/usr/bin/pdflatex
infile=”$1″
tmpdir=”/tmp/$$”
mkdir “$tmpdir”
cp “$infile” “$tmpdir/in.pdf”
cd “$tmpdir”
# invert pages on top half
$pdflatex \\batchmode \‘\documentclass[a4paper,portrate]{book}\
\usepackage{pdfpages}\\begin{document}\\includepdf[pages=1, angle=180]{in.pdf}\\includepdf[pages=2-5]{in.pdf}\\includepdf[pages=6-8, angle=180]{in.pdf}\\end{document}’mv book.pdf in.pdf# impose pages into mini booklet$pdflatex \\batchmode \‘\documentclass[a4paper,landscape]{book}\\usepackage{pdfpages}\\begin{document}\\includepdf[nup=4×2, pages={1,8-6,2-5}, trim=24mm 10mm 24mm 10mm, cut, frame]{in.pdf}\\end{document}’mv book.pdf $OLDPWDrm -rf “$tmpdir” 