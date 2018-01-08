#!/usr/bin/env bash

#Napisać program, który działa jak grep: wybiera z pliku wejściowego linie paujące do wzorca. Wzorzec jest parametrem programu. (paramatry programu przechowuje zmienna @ARGV, patrz 'man perlvar')

echo 'cat ../cw2/slowa.lst | ./cw3.rb "^(.?)(.?)(.).?\3\2\1$"'
cat ../cw2/slowa.lst | ./cw3.rb "^(.?)(.?)(.).?\3\2\1$"
