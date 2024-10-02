# Extra queries

Some of the queries have solutions. Click on them to reveal it.

Note: datalog uses syntax from Prolog, i.e. `:-` instead of arrow and `\+` for negation.

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

* people who cook, but not eat

    <details>
    <summary>datalog</summary>

    ```
        answer(A) :- cooks(A, _), \+ eats_something(A).
        eats_something(A) :- eats(A, _).
    ```
    </details>

* people cooking a unique meal that no one else cooks

    <details>
    <summary>datalog</summary>

    ```
        cooked_by_two(J) :- cooks(A, J), cooks(B, J), \+ A = B.
        answer(A) :- cooks(A, J), \+ cooked_by_two(J).
    ```
    </details>

* people cooking a meal that is cooked by everyone that cooks something

    <details>
    <summary>datalog</summary>

    ```
        not_cooked_by_someone(J) :- cooks(A, _), \+ cooks(A, J).
        answer(A) :- cooks(A, J), \+ not_cooked_by_someone(J).
    ```
    </details>

* meals that are cooked by someone, but eaten by no one who cooks

    <details>
    <summary>datalog</summary>

    ```
        answer(M) :- cooks(_, M), \+ eaten(M).
        eaten(M) :- eats(X, M), cooks(X, _).
    ```
    </details>

* meals that are eaten by everyone who does not cook anything but eats something (and are eaten by someone)

    <details>
    <summary>datalog</summary>

    ```
        answer(M) :- eats(_, M), \+ not_eaten(M).
        not_eaten(M) :- eats(X, _), \+ cooks_something(X), \+ eats(X, M), eats(_, M).
        cooks_something(X) :- cooks(X, _).
    ```
    </details>

* meals that are cooked, but not by Simon

    <details>
    <summary>datalog</summary>

    ```
        answer(M) :- cooks(_, M), \+ cooks(simon, M).
    ```
    </details>

* meals that are cooked by everyone who cooks except Simon

    <details>
    <summary>datalog</summary>

    ```
        answer(M) :- cooks(_, M), \+ cooks(simon, M), \+ not_cooked(M).
        not_cooked(M) :- cooks(_, M), \+ cooks(X, M), cooks(X, _), X != simon.
    ```
    </details>

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
    enrolled(Student, Course)
    passed(Student, Course)
    failed(Student, Course)
    teaches(Professor, Course)
```

Queries:

* students that are enrolled in a course, but have not passed any course

    <details>
    <summary>datalog</summary>

    ```
        answer(A) :- enrolled(A, _), \+ passed_something(A).
        passed_something(A) :- passed(A, _).
    ```
    </details>

* students who are enrolled in a course that no one else is enrolled in

    <details>
    <summary>datalog</summary>

    ```
        enrolled_by_two(C) :- enrolled(A, C), enrolled(B, C), \+ A = B.
        answer(S) :- enrolled(S, C), \+ enrolled_by_two(C).
    ```
    </details>

* courses that are failed by no student except one

    <details>
    <summary>datalog</summary>

    ```
        answer(C) :- fails(_, C), \+ multiple_fails(C).
        multiple_fails(C) :- failed(S1, C), failed(S2, C), \+ S1 = S2.
    ```
    </details>

* courses that are passed by someone, and also everyone who does not teach anything but is enrolled in a course

    <details>
    <summary>datalog</summary>

    ```
        answer(C) :- passed(_, C), \+ not_passed_when_it_should(C).
        not_passed_when_it_should(C) :- enrolled(X, _), \+ teaches_something(X), \+ passed(X, C), passed(_, C).
        teaches_something(X) :- teaches(X, _).
    ```
    </details>

* courses (passed by someone) that are passed by everyone who does not teach anything but is enrolled in all courses

    <details>
    <summary>datalog</summary>

    ```
        answer(C) :- passed(_, C), \+ not_passed_when_it_should(C).
        not_passed_when_it_should(C) :-
            \+ not_enrolled_somewhere(X), \+ teaches_something(X),
            \+ passed(X, C), passed(_, C), enrolled(X, _).
        teaches_something(X) :- teaches(X, _).
        not_enrolled_somewhere(X) :- enrolled(X, _), \+ enrolled(X, C), enrolled(_, C).
    ```
    Notice how we had to include two positive contexts that were not mentioned in the original query
    (i.e. the query would need additional clarification to be precise, despite sounding complete).
    </details>

---

Database:
```
    involved(Who, Project, Salary)
```

Queries:

* people who are the only ones involved in a particular project

    <details>
    <summary>datalog</summary>

    ```
        involved_by_two(P) :- involved(A, P, _), involved(B, P, _), \+ A = B.
        answer(A) :- involved(A, P, _), \+ involved_by_two(P).
    ```
    </details>

* people involved in all projects where someone earns 1000 (and are involved somewhere)

    <details>
    <summary>datalog</summary>

    ```
        works_on(A, P) :- involved(A, P, _).
        misses_project(A) :- involved(_, P, 1000), \+ works_on(A, P).
        answer(A) :- involved(A, _, _), \+ misses_project(A).
    ```
    </details>

* people such that on every project they are involved in, there is someone earning more than them (and are involved somewhere)

    <details>
    <summary>datalog</summary>

    ```
        answer(A) :- involved(A, _, _), \+ wrong_project_for(A).
        wrong_project_for(A) :- involved(A, P, _), \+ someone_earns_more_than(A, P).
        someone_earns_more_than(A, P) :- involved(A, P, SA), involved(B, P, SB), SB > SA.
    ```
    </details>

* people who are involved in projects where everyone earns the same salary

    <details>
    <summary>datalog</summary>

    ```
        different_salaries(P) :- involved(_, P, S1), involved(_, P, S2), \+ S1 = S2.
        answer(A) :- involved(A, P, _), \+ different_salaries(P).
    ```
    </details>

* people who are only involved in projects where everyone earns the same salary (and are involved somewhere)

    <details>
    <summary>datalog</summary>

    ```
        different_salaries(P) :- involved(_, P, S1), involved(_, P, S2), S1 \= S2.
        works_in_wrong_project(A) :- involved(A, P, _), different_salaries(P).
        answer(A) :- involved(A, _, _), \+ works_in_wrong_project(A).
    ```
    </details>

* people who are involved in all projects where everyone earns the same salary (and are involved somewhere)

    <details>
    <summary>datalog</summary>

    ```
        different_salaries(P) :- involved(_, P, S1), involved(_, P, S2), S1 \= S2.
        project_with_same_salaries(P) :- involved(_, P, _), \+ different_salaries(P).
        works_on(A, P) :- involved(A, P, _).
        not_involved_in_same_salaries_projects(A) :- project_with_same_salaries(P), \+ works_on(A, P), involved(A, _, _).
        answer(A) :- involved(A, _, _), \+ not_involved_in_same_salaries_projects(A).
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

