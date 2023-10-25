lex lexer.l
gcc lex.yy.c -o generator
./generator<input.c