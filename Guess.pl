
main :-
  random_between(1, 20, RandNum),
  write(RandNum),
  game(RandNum).
game(Rand) :-
  write('Guess a number between 1 and 20: '), nl,
  read(Guess),
  Guess \= Rand -> write('Sorry thats the wrong number. Try again.'),
  game(Rand).