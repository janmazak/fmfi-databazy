# Extra queries

Some of the queries have solutions. Click on them to reveal it.

---

Database:
```
    wears(Person, Trousers, How_many_times)
    price(Trousers, Amount)
```

Queries:

* trousers that cost less than 20 and someone wore them at least twice

    <details>
    <summary>datalog</summary>

    ```
        answer(P) :- price(T, A), A < 20, wears(_, T, N), N >= 2.
    ```
    </details>

* people that wear at least two different trousers with price above 100

    <details>
    <summary>datalog</summary>

    ```
        answer(P) :- 
            wears(P, T1, H1), H1 > 0, price(T1, A1), A1 > 100, 
            wears(P, T2, H2), H2 > 0, price(T2, A2), A2 > 100,
            \+ T1 = T2.
    ```
    </details>

---

Database:
```
    cooks(Who, Meal)
    eats(Who, Meal)
```

Queries:

* those that only cook meals that are eaten by at most one person (and have cooked at least one such meal)

    <details>
    <summary>datalog</summary>

    ```
        eaten_by_two(M) :- eats(X, M), eats(Y, M), \+ Y = M.
        cooks_wrong(A) :- cooks(A, M), eaten_by_two(M).
        answer(A) :- cooks(A, M), \+ eaten_by_two(M), \+ cooks_wrong(A).
    ```
    </details>

* those that eat all meals cooked by exactly one or two persons and eat at least something

    <details>
    <summary>datalog</summary>

    ```
        cooked_by_three(M) :- 
            cooks(A1, M), cooks(A2, M), cooks(A3, M),
            \+ A1 = A2, \+ A2 = A3, \+ A3 = A1.
        fails_to_eat(A) :- eats(A, _), \+ eats(A, M), cooked(_, M), \+ cooked_by_three(M).
        answer(A) :- eats(A, _), \+ fails_to_eat(A).
    ```
    </details>

---

Database:
```
    lubi(P, A)
    capuje(K, A)
    navstivil(I, P, K)
    vypil(I, A, M)
```
Abbreviated attributes: `P = Pijan, A = Alkohol, K = krcma, I = Id_navstevy, M = Mnozstvo`. Assume that `Mnozstvo` is always positive. In `navstivil` and `vypil`, the attribute `I` uniquely identifies the visit of a particular `Pijan` in a particular `Krcma` (there are no group visits). There are no NULLs in the database.

Queries:

* krčmy, kde niečo čapujú a bol tam vypitý každý alkohol, čo ľúbia aspoň dvaja pijani

    <details>
    <summary>datalog</summary>

    ```
        answer(K) :- capuje(K, _), nevypity_spravny_alkohol(K).
        nevypity_spravny_alkohol(K) :- lubi(P1, A), lubi(P2, A), \+ P1 = P2,
                                       capuje(K, _), \+ vypity(K, A).
        vypity(K, A) :- navstivil(I, _, K), vypil(I, A, _).
    ```
    </details>

* pijani, čo ľúbia aspoň jeden alkohol a ľúbia všetky alkoholy, čo niekde čapujú a nikto ich nepil v žiadnej krčme

    <details>
    <summary>datalog</summary>

    ```
        answer(P) :- lubi(P, _), \+ nelubi_co_ma(P).
        nelubi_co_ma(P) :- capuje(_, A), \+ vypity(A), \+ lubi(P, A), lubi(P, _).
        vypity(A) :- vypil(_, A, _).
    ```
    </details>

* pijani, ktorí niečo ľúbia, ale nikdy v krčme nepijú

    <details>
    <summary>SQL</summary>

    ```sql
    	SELECT l.P
    	FROM lubi l
    	WHERE NOT EXISTS (
    		SELECT 1
    		FROM navstivil n, vypil v
    		WHERE n.I = v.I AND n.P = l.P
    	)
    ```
    </details>

* pijani, čo už pili, a pri každej návšteve krčmy vypijú aspoň liter nejakého (jedného) alkoholu

    <details>
    <summary>SQL</summary>

    ```sql
    	SELECT n.P
    	FROM navstivil n, vypil v
    	WHERE n.I = v.I AND NOT EXISTS (
    		SELECT 1
    		FROM navstivil n2
    		WHERE n2.P = n.P AND NOT EXISTS (
    			SELECT 1
    			FROM vypil v2
    			WHERE v2.I = n2.I and v2.M >= 1
    		)
    	)
    ```
    </details>

    <details>
    <summary>SQL2</summary>

    ```sql
    	SELECT n.P
    	FROM navstivil n, vypil v
    	WHERE n.I = v.I AND NOT EXISTS (
    		-- funguje za predpokladu, ze pri kazdej navsteve bol vypity aspon 1 alkohol
    		SELECT 1
    		FROM navstivil n2 JOIN vypil v2 ON n2.I = v2.I
    		WHERE n2.P = n.P
    		GROUP BY n2.I
    		HAVING MAX(v2.M) < 1
    	)
    ```
    </details>

