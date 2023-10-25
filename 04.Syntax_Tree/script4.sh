lex lex.l
yacc -d parse.y
gcc -w y.tab.c -o syntax_gen
./syntax_gen<input.c