# Domáca úloha č. 3 (20 bodov)

Úloha pozostáva z dvoch častí: rozšírenie tabuľky evidujúcej vyriešené testy o skóre a napísanie programu, pomocou ktorého budú študenti cez konzolu vypĺňať test. Budeme používať databázu popísanú v [druhej domácej úlohe](../du2/du2.md).

### Skóre

Do tabuľky, kde evidujete vypracovania testov študentmi, chceme pridať stĺpec pre _skóre_, t.j. podiel správnych odpovedí k celkovému počtu otázok testu, zaokrúhlený na celé percentá (číslo typu DECIMAL s dvomi desatinnými miestami). Tento údaj je možné zistiť z jednotlivých zodpovedaných otázok, preto je redundantný. Umožňuje však rýchlejšie spracovanie dotazov zahŕňajúcich výpočet skóre. Aby sme zabezpečili konzistenciu databázy, treba pridať [trigger](https://www.sqlitetutorial.net/sqlite-trigger/), ktorý pri zmene zodpovedaných otázok automaticky prepočíta zodpovedajúce skóre.

Samozrejme, v reálnej situácii by sme chceli aj druhý trigger, ktorý nedovolí zmenu skóre alebo skontroluje, že nová hodnota zodpovedá odpovediam na otázky. Je tiež možné navrhnúť komplikovanejšie riešenia, ktoré sú efektívnejšie, ale použité prostriedky sú zvyčajne veľmi špecifické pre konkrétny DBMS. V rámci domácej úlohy ostaneme pri tejto jednoduchej verzii s jediným triggerom.

Vytvorenie pomocou `CREATE TRIGGER` pridajte do súboru `testy.sql`, v ktorom máte vytváranie databázových tabuliek.

### Program

Rozšírte tabuľku študentov o unikátne prihlasovacie meno, t.j. nejaký textový identifikátor študenta (heslo budeme pre jednoduchosť ignorovať).

Vytvorte program v Pythone (v jedinom súbore `testy.py`) s nasledovnou funkcionalitou:
* Interaktívne komunikuje s užívateľom cez terminál (konzolu).
* Po spustení si vyžiada prihlasovacie meno študenta; ak sa nenašlo, opakovane si ho bude pýtať znovu.
* Po zadaní existujúceho prihlasovacieho mena program vypíše zoznam testov pridelených študentovi vrátane doteraz najlepšieho vypracovania ku každému testu (t.j. s najvyšším skóre) a študent zadaním poradového čísla vyberie test, ktorý ide vypracovať.
* Následne program bude zadávať jednotlivé otázky zvoleného testu v náhodnom poradí. Študent si zakaždým vyberie odpoveď (napísaním jedného z písmen a, b, c, d) a program ju zaznamená do pomocnej tabuľky.
* Po zodpovedaní všetkých otázok testu program presunie v rámci jedinej transakcie všetky študentove odpovede z pomocnej tabuľky medzi trvalé záznamy, zaeviduje čas vypracovania a vypíše skóre.

Poznámka: Dočasnú tabuľku by sme mohli využiť na priebežné ukladanie študentovej práce a v prípade pádu programu sa potom vie študent vrátiť k nedokončenému testu. Nebudeme to však robiť v rámci tejto domácej úlohy.

#### Ďalšie požiadavky

Nezabudnite na detekciu a spracovanie databázových chýb a súvisiacich výnimiek. (Vo všeobecnosti v reálnej situácii si treba podrobnejšie naštudovať, aké rôzne chyby konkrétny DBMS reportuje, napr. [SQLite](https://www.sqlite.org/rescode.html), ale program v tejto domácej úlohe sa v princípe nevie z chýb zmysluplne spamätať a asi najrozumnejšie je proste ukončiť pri akejkoľvek chybe jeho činnosť.)

Váš programovací štýl nemusí byť zďaleka dokonalý, ale snažte sa držať aspoň základných zásad: zmysluplné pomenovanie premenných, oddelenie častí kódu do funkcií, využitie `?` pri vytváraní databázových dotazov miesto lepenia reťazcov, konzistentné formátovanie atď. Možno sa to nezdá, ale už z prvého pohľadu na kód možno usúdiť nie málo o kvalite vašej práce, a veľká časť schopnosti písať čitateľný kód spočíva vo vytvorení návykov, nestojí to zväčša ani čas navyše (dokonca možno nejaký aj ušetríte, až budete v programe hľadať prípadné chyby).

#### Dáta na vyskúšanie

Do súboru `testy.sql` doplňte pridanie testu s názvom `Trivia` a nasledovnými otázkami (správna odpoveď je označená hviezdičkou):
```
Which of the following is not an international organisation?
A. FIFA
B. NATO
C. ASEAN
*D. FBI

Which of the following disorders is the fear of being alone?
A. agoraphobia
B. aerophobia
C. acrophobia
*D. none of the above

In which country is Transylvania?
A. Bulgaria
*B. Romania
C. Croatia
D. Serbia
```

Tento test prideľte študentovi s prihlasovacím menom `x`.

### Technické pokyny

* Termín na odovzdanie: **3. 1. 2024**.
* Používajte korektnú syntax SQL podporovanú databázou SQLite 3.34 alebo Postgresql 13.13 (overiť si to môžete trebárs na serveri `cvika.dcs.fmph.uniba.sk`).
* Používajte len základné štandardné knižnice jazyka Python vo verzii 3.9.
* Riešenia so syntaktickými chybami budú hodnotené len malým počtom bodov.
* Súbory `testy.sql` a `testy.py` odošlite ako prílohy e-mailu s predmetom `DAV-DU3` na adresu `jan.mazak@fmph.uniba.sk`.
