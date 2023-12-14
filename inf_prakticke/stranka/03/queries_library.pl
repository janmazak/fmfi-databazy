:- consult('query.pl').

/*

Consider the following database scheme:

reader(Ir, Name, RegistrationDate)      // Ir is a unique reader id
book(Ib, Title, Author)                 // Ib is a unique book id
borrowing(Ir, Ib, BorrowingDate, ReturnDate)

Represent dates by integers describing number of days that have passed since a fixed date (e. g. 2018/01/01).
If a reader has not returned a book, ReturnDate is represented by the constant null.

*/

/* 0. Create the file "library.pl" containing at least 2 records for each table (predicate). 

Required: Do not use spaces in string constants and start every string constant with a lower-case letter.

Advisable: Use artificial names for both people and books, e.g. 'r01' and 'r02' for readers and 'b01' for a book. It would be easier to extend the dataset later.
Another option is to use meaningful names for entries with specific properties, e.g. 'readerThatNeverBorrowed'.
*/

:- consult('library.pl').

/*  1. Print names and registration dates of all readers. */

/*  2. Print titles of all books that have been borrowed at least once. */

/*  3. Print titles of all books that have never been borrowed. */

/*  4. Find names of all registered readers that have never borrowed a book. */

/*  5. Print all triples [R, B, BorrowingDate], where B is the title of a book that was borrowed by a reader R, but has not been returned yet. */

/*  6. Find names of all readers that returned all the books they borrowed. */

/*  7. Print all pairs [R, B] such that B is the title of a book that the reader R borrowed at least twice. */

/*  8. Print all pairs [R, B] such that B is the title of a book that the reader R borrowed exactly twice. */

/*  9. Find names of all readers that borrowed at least two different books and such that all the books they borrowed were written by the same author. */

/* 10. For each registered reader list the name of the first book he borrowed (or null if he has never borrowed anything). */

/* 11. Find names of all authors such that every reader borrowed at least one of their books. */

/* 12. Find all readers that borrowed at least once every book that has ever been borrowed from this library. */

/* 13. Find pairs [R, LB], where LB is the length (in days) of the longest borrowing of the reader R (we are not interested in books that have not been returned yet). */

/* 14. Find readers that did not borrow anything during the day of their registration and never borrow more than one book. */

/* 15. Find readers that returned every book they borrowed and each time they returned a book, they did so in a time shorter than that of at least one other reader. */

/* 16. Find meticulous readers that read books "author by author": if they read a book from an author, then they exclusively read books of that author until they have read all such books available from the library.
(Beware: it is possible that they read books of an author more than once and in between they read books of another author. 
Borrowing of several books is allowed, but they must all be of the same author, i. e. a meticulous reader will not borrow a book from a new author until he has returned all the books of the present author.*/


/* ===================================================== Slovak version =================================================================*/


/*

Uvazujme nasledujucu databazovu schemu:

citatel(Ic, Meno, DatumRegistracie)      // Ic je unikatne id citatela
kniha(Ik, Nazov, Autor)                  // Ik je unikatne id knihy
vypozicka(Ic, Ik, DatumPozicania, DatumVratenia)

Datumy reprezentujte ako cele cislo vyjadrujuce pocet dni, ktore uplynuli od fixneho datumu (napr. 1. 1. 2018).
Ak citatel knihu este nevratil, DatumVratenia je konstanta null.

*/

/* 0. Vytvorte subor "kniznica.pl", ktory bude obsahovat aspon 2 zaznamy v kazdej tabulke (pre kazdy predikat). Do tohto suboru potom priebezne doplnajte dalsie zaznamy, aby ste vedeli overit spravnost predikatov napisanych nizsie.

Poziadavka: Nepouzivajte v retazcovych konstantach medzery a zacinajte ich malym pismenom.

Odporucanie: Pre osoby aj knihy pouzite systematicke umele pomenovania, napr. 'r01' a 'r02' pre citatelov a 'b01' pre knihu. V pripade potreby tak bude v buducnosti lahsie rozsirit obsah databazy. 
*/

:- consult('kniznica.pl').

/*  1. Vypiste mena a datumy registracie vsetkych citatelov. */

/*  2. Vypiste nazvy vsetkych knih, ktore niekedy boli pozicane. */

/*  3. Vypiste nazvy knih, ktore si este nikto nepozical. */

/*  4. Najdite mena citatelov, ktori si este nic nepozicali. */

/*  5. Vypiste vsetky trojice [C, K, DatumPozicania], kde K je nazov knihy, ktoru si citatel s menom C pozical, ale este ju nevratil. */

/*  6. Najdite mena citatelov, ktori vratili vsetky knihy, ktore si pozicali. */

/*  7. Vypiste dvojice [C, K] take, ze K je nazov knihy, ktoru si citatel C pozical aspon dvakrat. */

/*  8. Vypiste dvojice [C, K] take, ze K je nazov knihy, ktoru si citatel C pozical prave dvakrat. */

/*  9. Vypiste mena citatelov, ktori si pozicali aspon dve rozne knihy, pricom vsetky ich pozicane knihy boli od toho isteho autora. */

/* 10. Ku kazdemu citatelovi vypiste nazov prvej knihy, ktoru si pozical, alebo null, ak si nikdy nepozical nic. */

/* 11. Najdite mena autorov, ktorych knihu si pozical kazdy citatel (aspon jednu, aspon raz). */

/* 12. Najdite citatelov, ktori si vypozicali vsetky knihy, ktore kedy boli pozicane. */

/* 13. Najdite dvojice [C, NP], kde NP je pocet dni najdlhsej vypozicky citatela C (knihy, ktore citatel este nevratil, nas nezaujimaju). */

/* 14. Najdite citatelov, ktori si nepozicali nic v den, ked sa zaregistrovali, a naraz maju pozicanu vzdy nanajvys jednu knihu. */

/* 15. Najdite citatelov, ktori kazdu knihu, co si pozicali, vratili, a to za dobu kratsiu ako nejaky iny citatel. */

/* 16. Najdite citatelov, ktori si citaju knihy "po autoroch": ak raz precitaju knihu od nejakeho autora, citaju len knihy tohto autora, az kym neprecitaju vsetky jeho knihy, ktore su v kniznici. (Pozor: mozu citat knihy od jedneho autora viac ako raz a medzitym citat cosi od ineho autora. */
