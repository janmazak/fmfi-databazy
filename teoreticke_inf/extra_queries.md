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



