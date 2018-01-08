#!/usr/bin/env bash

#Napisać procesor obsługujący dyrektywy
# #define napis1 napis2
#mające takie działanie jak w przypadku preprocesora języka C: wszystkie wystąpienia napisu napis1 w tekście następującym po dyrektywie powinny być zastąpione przez napis2. Dyrektyw takich może się pojawić wiele. Dyrektywy nie są przepisywane do pliku wyjściowego.
# Przykład:
# wejście:
#  F=PI*R*R
#  #define PI 3.14
#  F=PI*R*R
#  #define R 100
#  F=PI*R*R
# wyjście:
#  F=PI*R*R
#  F=3.14*R*R
#  F=3.14*100*100

echo "./cw4.rb < cw4.in"
./cw4.rb < cw4.in
