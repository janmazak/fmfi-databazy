# Datalog

It is possible to use SWI-Prolog as the computational engine for Datalog. Use can use the [online environment](https://swish.swi-prolog.org/), the server `cvika` or install SWI-Prolog on your own computer. If you are interested in Prolog, there is an easy-to-read [manual](https://staff.fnwi.uva.nl/u.endriss/teaching/prolog/prolog.pdf). For using Datalog, there is a short summary of syntax you will need.

* Strings starting with a capital are considered variables. Strings starting with a lower case letter are treated as constants. (If you mess this up, you can get a wide range of unexpected outcomes, including weirdly-looking error messages.)

* Evaluation of arithmetic expression is done by the operator `is`, for instance, `X is 2+3`, not `X = 2+3` (the latter statement would be interpreted as unification of terms instead of an arithmetic operation).

* For comparisons, use operators `<`, `=<`, `>`, `>=` (not all are the same as in C!).

To run SWI-Prolog in a terminal with an input file `queries.pl`, use
```
	swipl -s queries.pl
```
The following commands are useful:

* `make.` (don't forget the dot) to compile the file with queries (or other files if those have changed). Check the output for errors (e.g. undefined predicates).

* `q(answer(X, Y)).` to see the tuples `[X, Y]` satisfying the predicate `answer`. It does not matter how you name the variables (`X` and `Y` in this example), but the arity must be satisfied. You can just use `_`. However, if you used the same variable twice, it restricts the result to those tuples that have the same value in the places given by the repeated variable. The `q()` around it is used for formatting the Prolog output in a nice way (and removes the seemingly duplicate values in the output).
