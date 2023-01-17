# Otázky na skúšku

Príklady otázok na skúšku; čísla v zátvorkách udávajú počet bodov:

---

* životný cyklus dotazu --- podrobne popíšte, čo sa deje v DBMS medzi prijatím dotazu a odoslaním výsledkov (12 b)
* normalizácia --- čo a prečo je cieľom, či sa to dá vždy dosiahnuť, v akých situáciách je vhodné zľaviť z požiadaviek na normalizáciu (8 b)

---

* transakcie --- ako umožniť paralelné spracovanie, za čo je zodpovedný DBMS a ako to DBMS dosahuje (9 b)
* čo možno a nemožno vyjadriť v dotazovacích jazykoch; ako sa vyjadrujú netriviálne veci, napr. negácia, rekurzia (9 b)
* čo neželané sa môže stať, ak relácie nie sú v BCNF (2 b)

---

* obnoviteľnosť: ako zabezpečiť spoľahlivé permanentné uloženie dát (aj pri paralelnom spracovaní) (8 b)
* ako databáza optimalizuje výpočty a aký vplyv na rýchlosť výpočtu má množstvo operačnej pamäti (uviesť podrobne konkrétny príklad, kde na tom výrazne záleží) (8 b)
* čo sú funkčné závislosti a prečo ich chceme zachovať pri dekompozícii relácií (4 b)

---

* životný cyklus dotazu --- podrobne popíšte, čo sa deje v DBMS medzi prijatím dotazu a odoslaním výsledkov (12 b)
* akými prostriedkami možno zabezpečiť konzistentnosť databázy v PostgreSQL (4 b)
* akými rôznymi spôsobmi možno počítať join na úrovni fyzických operátorov (aj mimo relačnej databázy) (4 b)

---

* relačná algebra --- čo to je a na čo slúži; súvislosť s fyzickými operátormi (7 b)
* teoretické a praktické možnosti pre úroveň sériovateľnosti transakcií (7 b)
* rozdiel medzi 3NF a BCNF (ideálne aj uviesť príklad relácie), kedy existuje dekompozícia do týchto NF a kedy nie (6 b)

---

* relačný model --- čo sú atribúty, relácie a funkčné závislosti; bezstratové spájanie dekompozície (5 b)
* čo nemožno vyjadriť v dotazoch bez rekurzie a ako sa rekurzia počíta v bežných DBMS (7 b)
* obnoviteľnosť: ako zabezpečiť spoľahlivé permanentné uloženie dát (aj pri paralelnom spracovaní) (8 b)

---

### Bežné neznalosti

* dôkaz existencie 3NF (štandardný algoritmus cez minimálne pokrytia)
* relačná algebra (štruktúra dotazov, logické vs. fyzické operátory)
* podrobnejšie príklady činnosti fyzických operátorov (ako rátať join či sort --- hodí sa na spracovanie dát vo všeobecnosti aj mimo DBMS)
* nepochopenie rozdielu medzi zachovávaním funkčných závislostí a bezstratovosťou dekompozície

