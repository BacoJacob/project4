%http://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/factsrules.html, https://www.101computing.net/solving-a-zebra-puzzle-using-prolog/

animal(grizzly).
animal(moose).
animal(seal).
animal(zebra).

creator(joanne).
creator(lou).
creator(ralph).
creator(winne).

dest(circus).
dest(rockband).
dest(spaceship).
dest(train).

solve :- 

    animal(JoannesFriend), 
    animal(LousFriend), 
    animal(RalphsFriend), 
    animal(WinniesFriend),
    different([JoannesFriend, LousFriend, RalphsFriend, WinniesFriend]),

    dest(JoannesAdventure), 
    dest(LousAdventure), 
    dest(RalphsAdventure), 
    dest(WinniesAdventure),
    different([JoannesAdventure, LousAdventure, RalphsAdventure, WinniesAdventure]),

  Triples = [ [joanne, JoannesFriend, JoannesAdventure],
            [lou, LousFriend, LousAdventure],
            [ralph, RalphsFriend, RalphsAdventure],
            [winnie, WinniesFriend, WinniesAdventure]
            ],
            
    \+ member([joanne, seal,_], Triples),
    \+ member([lou, seal,_], Triples),

    \+ member([_, seal, spaceship], Triples),
    \+ member([_, seal, train],Triples),

    \+ member([joanne, grizzly, _], Triples),
    member([joanne, _, circus], Triples),

    member([winnie, zebra, _], Triples),

    \+ member([_,grizzly,spaceship], Triples),

    tell(joanne, JoannesFriend, JoannesAdventure),
    tell(lou, LousFriend, LousAdventure),
    tell(ralph, RalphsFriend, RalphsAdventure),
    tell(winnie, WinniesFriend, WinniesAdventure).

tell(X, Y, Z) :-
write(X),write('\''), write('s friend is a '), write(Y), write('. They went to the '),write(Z), write(' together.'), nl.

different([H | T]) :- member(H, T), !, fail.
different([_ | T]) :- different(T).
different([_]).
