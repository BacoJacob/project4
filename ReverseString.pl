% Sources used swi-prolog.org , https://stackoverflow.com/ , https://www.javatpoint.com/

main :-
  Name = "Jacob Casina",
  string_chars(Name, Temp_list),
  sort(0, @=<, Temp_list, Sorted),
  sort(0, @>=, Temp_list, Reversed),
  atomics_to_string(Sorted, Sorted_name),
  atomics_to_string(Reversed, Reversed_name),
  write(Sorted_name),
  nl,
  write(Reversed_name).

