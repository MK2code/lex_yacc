lex lex.l
yacc -d parse.y
gcc -w y.tab.c -o parser
./parser<input.c