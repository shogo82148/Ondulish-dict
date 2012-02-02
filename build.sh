#!/bin/sh
MECABLIBEXEC=`mecab-config --libexecdir`
perl toMeCabFormat.pl < corpus.txt
cd seed
$MECABLIBEXEC/mecab-dict-index
$MECABLIBEXEC/mecab-cost-train -c 1.0 corpus model
$MECABLIBEXEC/mecab-dict-gen -o ../final -m model
cd ..
cd final
$MECABLIBEXEC/mecab-dict-index
cd ..
$MECABLIBEXEC/mecab-test-gen < seed/corpus > test.sen
mecab -d final test.sen > test.result
$MECABLIBEXEC/mecab-system-eval test.result seed/corpus
