# Simple.asm
Vom face un for prin care vom lua fiecare element din sir intr-un registru si vom copia in alt registru sirul modificat.Dupa ce vom lua fiecare litera, vom aduna 'cheia' si vom compara cu Z, in cazul in care depaseste
ultima litera din alfabetul englez, atunci voms cadea 26, numarul de litere din alfabetul engelz,dupa care vom adauga in sir si vom incrementa pentru a nu suprascrie

# Points-distance.asm
Vom lua mai intai in doua registre coordonatele celor doua puncte si le vom compara pentru a afla daca sunt egale, caz in care ne vom muta in coorodnatele lui y si pe care le vom compara
pentru a scadea din numarul mare numarul mic . Acelasi lucru vom proceda si pentru coordonatele lui x si vom muta intr-un singur registru punctul final.

# Road.asm
Vom proceda la fel, insa de aceasta data va fi un vector si vom face un loop care va fi egala cu lungimea sirului - 1 ,

# Is_square.asm 
Vom incerca sa formam noi patrate perfecte pe care le vom forma de la 1 la n, de exemplu daca numarl este 5, atunci vom forma 4,9,16,25 si vom compara cu 5.
Avem doua exceptii, daca numarul este 1 respectiv 0, atunci numarul este patrat perfect. In cazul in care nr este patrat perfect vom intoarce 1 intr-un sir, in caz contrar 0

# Beaufort.asm
Nu am folosit acea matrice deoarece am descoperit o formula pe mai multe cazuri vom muta in doua registre elementul din sir si elementul cheie. in alte doua registre 
pastram cati pasi facem pentru a putea reseta cheia, si altul care stocheaza cati pasi facem pentru a ajunge la sfasitul sirului, caz in care executia programului se termina. Daca comparam
registrele in care avem elementele atunci avem doua cazuri, mai mic sau egal sau mai mare.
In cazul in care este mai mic atunci scadem din al mare in al mic si adunam 65 deoarece 65 este A in caz contrar vom scadea din al mare in al mic, si vom calcula pe baza lui Beaufort.
In final vom elementele intr-un vector, vom aduna in in registre cate unu pentru a reseta cheia sau pentru a termina executia. Vom muta dupa toate elementele in vectorul cerut
