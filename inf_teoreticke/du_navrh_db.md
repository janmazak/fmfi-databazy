# Návrh databázovej schémy

Úloha sa rieši v skupinách s 1-3 členmi.
Odovzdať do **12. 12. 2024** 23:59 e-mailom (jeden za celú skupinu, členovia skupiny do kópie).

# Popis modelovaného sveta

Predávame cestovné lístky na diaľkové autobusové linky. Chceme evidovať aj v minulosti predané lístky, nielen aktuálne platné.

Linka má číslo, postupnosť zastávok, odchody z nástupnej stanice a k nim priradené autobusy. Interval medzi zastávkami je vždy rovnaký (čas i vzdialenosť, bez ohľadu na odchod autobusu z východzej stanice). Na jednej linke môže premávať viacero typov autobusov, napr. väčšie v čase špičky; predpokladáme, že autobus daného typu je vždy k dispozícii a nebude vymenený za iný typ ani v prípade poruchy. Linky sa v čase nemenia.

Lístok má meno cestujúceho, odkiaľ, kam, čas odchodu a príchodu, ktorá linka, povinnú miestenku, cenu a uplatnenú zľavu; sedadlo je pre celú cestu rovnaké, neprestupuje sa.

Základná cena lístka bude počítaná funkciou (do ktorej vstupuje dĺžka cesty atď.), v databáze ju neevidujeme. Individuálne sa uplatňuje percentuálna zľava podľa doterajších km daného cestujúceho (zadané tabuľkou s intervalmi, tú v databáze chceme). Predpokladáme, že cestujúci majú doklad totožnosti, ktorý ich jednoznačne identifikuje.

# Úlohy

1. Vytvorte entitno-relačný model: entity, ich atribúty a primárne kľúče, vzťahy medzi entitami, entitno-relačný diagram.  (6 b)

2. Vytvorte "matematický" relačný model (bez prepisu do SQL): atribúty, relácie, funkčné závislosti;
k tomu bezstratová dekompozícia do BCNF zachovávajúca všetky funkčné závislosti (jej vlastnosti treba zdôvodniť).  (6 b)

# Poznámky

Ak potrebujete evidovať historické dáta pre situáciu, kde sa čosi mení, môže byť vhodné nahradiť odkazy cez cudzie kľúče fixnou kópiou údajov.
Príklad: v momente, keď predám lístok, zapíšem do tabuľky s lístkami jeho cenu (príp. aj s popisom, ako bola vypočítaná).
Ak sa v budúcnosti ceny zmenia, neovplyvní to existujúci lístok.

Iná možnosť je pridať k záznamom v tabuľke údaj o ich platnosti (nejaký status, príp. interval, počas ktorého sa záznam aplikuje).
Napr. tak možno evidovať v e-shope produkty, ktoré sa prestali vyrábať, aj s kompletným popisom (napr. pre účely reklamácií).
Toto však znamená, že sa bude náročnejšie kontrolovať konzistencia (napr. cez trigger kontrolujem, aby sa intervaly platnosti neprekrývali
--- ide o kontrolu mimo relačného modelu, ktorá sa nedá popísať funkčnými závislosťami).

V ERM by atribút entity nemal priamo súvisieť s inými entitami či ich atribútmi --- keďže pointou ERM je, že vzťahy explicitne špecifikuje.
Vnútri entity však môžu existovať platné funkčné závislosti, napr. ak máme viac ako jeden kľúč.

Pred prácou na úlohe si prejdite prezentáciu z prednášky a prípadne tiež
[túto ďalšiu](https://github.com/janmazak-fmfi/databazy/blob/main/dav_prednasky/p8/prezentacia8.pdf?raw=true).
