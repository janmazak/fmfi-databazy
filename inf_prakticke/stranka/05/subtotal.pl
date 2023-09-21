%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subtotal
% (c) 2009, Tomas Plachetka
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(subtotal, [subtotal/3]).

%subtotal(+Pred, +Glist, +Agglist)
%where Pred is a term containing only variables
%G_1, ..., G_g, A_1, ..., A_a and underscores,
%Glist = [G_1, ..., G_g] and
%Agglist = [A1' = AGG(A_1), ..., A_a' = AGG(A_a)]
%is a predicate equivalent with an SQL predicate
%select G_1, ..., G_g, 
%AGG(distinct A_1) as A_1', ..., AGG(distinct A_a) as A_a'
%from Pred
%group by G_1, ..., G_g;
%where AGG \in {count, sum, avg, stdev, min, max}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementation (SWI-Prolog)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subtotal(_, _, []).

subtotal(Pred, Glist, [S = sum(X) | Tail]) :- 
	term_variables(Pred, Vlist),
	subvars(Vlist, Glist, Elist),
	setof(Elist, Pred, _),
	bagof(X, Elist^setof(Glist, Pred, _), L), 
	sumlist(L, S),
	subtotal(Pred, Glist, Tail).

subtotal(Pred, Glist, [C = count(_) | Tail]) :-
	subtotal(Pred, Glist, [C = sum(1) | Tail]),
	subtotal(Pred, Glist, Tail).

subtotal(Pred, Glist, [A = avg(X) | Tail]) :- 
	subtotal(Pred, Glist, [S = sum(X) | Tail]),
	subtotal(Pred, Glist, [C = sum(1) | Tail]),
	C > 0, 
	A is S / C,
	subtotal(Pred, Glist, Tail).

subtotal(Pred, Glist, [D = stdev(X) | Tail]) :- 
	subtotal(Pred, Glist, [C = sum(1) | Tail]),
	subtotal(Pred, Glist, [A = avg(X) | Tail]),
	subtotal(Pred, Glist, [S = sum((X - A) * (X - A)) | Tail]),
	C > 1, 
	D is sqrt(S / (C - 1)),
	subtotal(Pred, Glist, Tail).

subtotal(Pred, Glist, [Min = min(X) | Tail]) :- 
	term_variables(Pred, Vlist),
	subvars(Vlist, Glist, Elist),
	setof(Elist, Pred, _),
	bagof(X, Elist^setof(Glist, Pred, _), L), 
	minlist(L, Min), 
	subtotal(Pred, Glist, Tail).

subtotal(Pred, Glist, [Max = max(X) | Tail]) :- 
	term_variables(Pred, Vlist),
	subvars(Vlist, Glist, Elist),
	setof(Elist, Pred, _),
	bagof(X, Elist^setof(Glist, Pred, _), L), 
	maxlist(L, Max), 
	subtotal(Pred, Glist, Tail).

subvars([], _, []).
subvars([V | Vtail], Glist, Elist) :-
	\+ vmember(V, Glist),
	subvars(Vtail, Glist, L),
	append(L, [V], Elist).
subvars([V | Vtail], Glist, Elist) :-
	vmember(V, Glist),
	subvars(Vtail, Glist, Elist).

vmember(X, [Y | _]) :-
	?=(X, Y).
vmember(X, [Y | Tail]) :-
	\+ ?=(X, Y),
	vmember(X, Tail).

sumlist([], 0).

sumlist([X | Tail], S) :- 
	sumlist(Tail, Sum),
	S is Sum + X.

minlist(List, Min) :- 
	member(Min, List),
	\+ notminlist(List, Min).

notminlist(List, Min) :- 
	member(X, List), 
	X < Min.

maxlist(List, Max) :- 
	member(Max, List),
	\+ notmaxlist(List, Max).

notmaxlist(List, Max) :- 
	member(X, List), 
	X > Max.
