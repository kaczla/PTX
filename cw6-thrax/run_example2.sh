#/bin/bash

#Skrypt uruchamia example2:
# Napisz gramatykę Thraxową, która do liczby nieujemnej (w zapisie dziesiętnym) dodaje 4.
#Podpowiedzi:
# - prościej zdefiniować automat odwrotny, a potem użyć funkcji Reverse
# - rozbić na 2 przypadki: dodawanie z przeniesieniem i bez przeniesienia
# - uwagi na ciąg dziewiątek przy przeniesieniu!
# - czasami trzeba wydłużyć liczbę o jedną cyfrę, transduktor
# "" : "1" dodaje jedynkę na końcu.

thraxrewrite-tester --far=example2.far --rules=PROCESS