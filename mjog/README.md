Języka mjog służący do opisu grafu:
* dla wierzchołka możliwe jest podanie:
- stylu
- kształtu
- koloru
- etykiety
* dla krawędzi możliwe jest podanie:
- stylu
- koloru
- etykiety
* domyślnych wartości kształtu i stylu dla krawędzi i wierzchołków
* komentarza

Styl:
* solid - ciągła linia
* dotted - wykropkowany
* bold - pogrubiona linia
* dashed - przerywana linia

Kształt:
* box - kwadrat
* circle - okrąg
* text - tylko tekst
* hexagon - sześciokąt

Kolor:
* red - czerwony
* green - zielony
* blue - niebieski
* black - czarny
* yellow - żółty
* orange - pomarańczowy

Struktura grafu wygląda następująco:
* Sekcja komentarzy rozpoczęta znakami: // Przykładowy opis
* Sekcja domyślnych ustawień: # [styl] [kształt]
{
Wierzchołki w formacie (obowiązkowy tylko numer): [numer wierzchołka] [styl] [kształt] [kolor] [opis]
}
{
Krawędzie w formacie (obowiązkowe numery wierzchołków): [numer wierzchołka 1] -> [numer wierzchołka 2] [styl] [kolor] [opis]
}

Przykładowy graf:
//
// Przykładowy graf
//
# hexagon dashed
{
1 box bold blue
2 circle
3 box red
4 dotted 'ala'
5 text 'tekst'
1
}
{
1 -> 2 bold
2 -> 3 'line'
3 -> 1 orange
4 -> 1 dotted 'new\nline'
}