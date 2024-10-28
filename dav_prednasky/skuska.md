# Témy na skúšku

Tieto témy zodpovedajú štátnicovým požiadavkám.

1. Jazyk SQL --- dotazy, join, vyjadrenie negácie a všeobecného kvantifikátora, agregácia, CTE, rekurzia, DDL, DML.
2. Výpočet dotazov v relačnom modeli --- relačná algebra, fyzické operátory (podrobne merge sort a hash join), plán výpočtu dotazu, základné princípy optimalizácie výpočtu dotazu (rozdiely oproti bežnej algoritmickej zložitosti), indexy (B-tree, hash index).
3. Teória navrhovania a normálne formy --- atribúty, funkčné závislosti, uzáver a pokrytie množiny funkčných závislostí, kľúče a nadkľúče, 3NF, BCNF, bezstratovosť dekompozície a zachovanie funkčných závislostí, redundancia a súvisiace anomálie (pri vkladaní, mazaní či zmene dát), entitno-relačný model.
4. Transakcie --- ACID, rozvrhy, úrovne sériovateľnosti, obnoviteľnosť (dirty read/write, kaskádový abort, algoritmus obnovy), dvojfázové zamykanie, generovanie striktných rozvrhov a riešenie deadlocku.


# Otázky na skúšku

Príklady otázok:

---

* životný cyklus dotazu --- podrobne popíšte, čo sa deje v DBMS medzi prijatím dotazu a odoslaním výsledkov
* normalizácia --- čo a prečo je cieľom, či sa to dá vždy dosiahnuť, v akých situáciách je vhodné zľaviť z požiadaviek na normalizáciu

---

* transakcie --- ako umožniť paralelné spracovanie, za čo je zodpovedný DBMS a ako to DBMS dosahuje
* čo možno a nemožno vyjadriť v dotazovacích jazykoch; ako sa vyjadruje negácia, všeobecný kvantifikátor, rekurzia
* čo neželané sa môže stať, ak relácie nie sú v BCNF

---

* obnoviteľnosť: ako zabezpečiť spoľahlivé permanentné uloženie dát (aj pri paralelnom spracovaní); dirty read a kaskádové aborty
* ako databáza optimalizuje výpočty a aký vplyv na rýchlosť výpočtu má množstvo operačnej pamäti (vysvetliť na príklade mergesortu)
* čo sú funkčné závislosti a prečo ich chceme zachovať pri dekompozícii relácií

---

* akými rôznymi spôsobmi možno počítať join na úrovni fyzických operátorov (aj mimo relačnej databázy)
* akými prostriedkami možno zabezpečiť konzistentnosť databázy v PostgreSQL
* riešenie deadlocku v transakčných systémoch
* minimálne pokrytie množiny funkčných závislostí a jeho využitie

---

* relačná algebra --- čo to je a na čo slúži; súvislosť s fyzickými operátormi
* teoretické a praktické možnosti pre úroveň sériovateľnosti transakcií
* rozdiel medzi 3NF a BCNF (ideálne aj uviesť príklad relácie), kedy existuje dekompozícia do týchto NF a kedy nie

---

* relačný model --- čo sú atribúty, relácie a funkčné závislosti; bezstratové spájanie dekompozície
* čo nemožno vyjadriť v dotazoch bez rekurzie a ako sa rekurzia počíta v bežných DBMS
* dvojfázové zamykanie (princíp, vlastnosti generovaných rozvrhov)
