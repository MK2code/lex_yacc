lex lex.l
yacc -d parse.y
gcc -w y.tab.c -o symbol_gen
./symbol_gen<input.c
