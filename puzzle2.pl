%http://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/factsrules.html, https://www.101computing.net/solving-a-zebra-puzzle-using-prolog/

month(febuary).
month(march).
month(june).
month(july).
month(december).

name(abigail).
name(brenda).
name(mary).
name(paula).
name(tara).

day(sunday).
day(monday).
day(wednesday).
day(friday).
day(saturday).

solve :- 

    month(abigailMonth), 
    month(brendaMonth), 
    month(maryMonth), 
    month(paulaMonth),
    month(taraMonth),
    different([abigailMonth, brendaMonth, maryMonth, paulaMonth, taraMonth]),

    day(abigailDay), 
    day(brendaDay), 
    day(maryDay), 
    day(paulaDay),
    day(taraDay),
    different([abigailDay, brendaDay, maryDay, paulaDay, taraDay]),

  Triples = [ [abigail, abigailMonth, abigailDay],
            [brenda, brendaMonth, brendaDay],
            [mary, maryMonth, maryDay],
            [paula, paulaMonth, paulaDay],
            [tara, taraMonth, taraDay]
            ],
            
    + member([paula, march,_], Triples),
    \+ member([paula, _, saturday], Triples),
    \+ member([abigail, _, friday], Triples),
    \+ member([abigail, _, wednesday], Triples),
    \+ member([tara, febuary,_], Triples),
    + member([tara, _, or(saturday, sunday)], Triples),
    \+ member([mary, december,_], Triples),
    + member([mary, _, or(saturday, sunday)], Triples),
    \+ member([mary, july,_], Triples),
    \+ member([brenda, _, friday], Triples),

    tell(abigail, abigailMonth, abigailDay),
    tell(brenda, brendaMonth, brendaDay),
    tell(mary, maryMonth, maryDay),
    tell(paula, paulaMonth, paulaDay),
    tell(tara, taraMonth, taraDay).

tell(X, Y, Z) :-
write(X), write(' birthday is on the month '), write(Y), write(' and on a '),write(Z), write('.'), nl.

different([H | T]) :- member(H, T), !, fail.
different([_ | T]) :- different(T).
different([_]).
or(X,Y) :- X; Y.
before(X,Y) :- indexOf([febuary, march, june, july, december], X, 0) < indexOf([febuary, march, june, july, december], Y, 0).
[febuary, march, june, july, december]
indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.