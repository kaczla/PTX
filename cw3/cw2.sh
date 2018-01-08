#!/usr/bin/env bash

#Napisać program, który zlicza linie pliku wejściowego. Uruchomić na trzy sposoby:
# przez jawne wywołanie interpretera perla (perl ...)
# jako plik wykonywalny
# z wykorzystaniem parametru -e/-ne/-pe 

echo "ruby cw2.rb"
ruby cw2.rb

echo ""

echo "./cw2.rb"
./cw2.rb

echo ""

echo "ruby -e \"print \"Hello!\n\"\""
ruby -e "print \"Hello!\n\""

