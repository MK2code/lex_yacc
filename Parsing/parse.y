%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
    void yyerror(const char *s);
    void fun();
    int yylex();
    int yywrap();
    int count=0;
%}

%token VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY INCLUDE RETURN 

%%

program: headers main '(' ')' '{' body return '}'
;

headers: headers headers
| INCLUDE
;

main: datatype ID
;

datatype: INT 
| FLOAT 
| CHAR
| VOID
;

body: FOR '(' statement ';' condition ';' statement ')' '{' body '}'
| IF '(' condition ')' '{' body '}' else
| statement ';' 
| body body
| PRINTFF '(' STR ')' ';'
| SCANFF '(' STR ',' '&' ID ')' ';'
;

else: ELSE '{' body '}'
|
;

condition: value relop value 
| TRUE 
| FALSE
;

statement: datatype ID init 
| ID '=' expression 
| ID relop expression
| ID UNARY 
| UNARY ID
;

init: '=' value 
|
;

expression: expression arithmetic expression
| value
;

arithmetic: ADD 
| SUBTRACT 
| MULTIPLY
| DIVIDE
;

relop: LT
| GT
| LE
| GE
| EQ
| NE
;

value: NUMBER
| FLOAT_NUM
| CHARACTER
| ID
;

return: RETURN value ';' 
|
;

%%

int main() {
    extern FILE *yyout;
    yyout=fopen("Output_ques2.txt","w");
    yyparse();
    if(count==0){
    printf("%s","Parsing done successfully\n");
    fprintf(yyout,"%s\n","Parsing done successfully\n");
    }
}

void yyerror(const char* msg) {
    count+=1;
    printf("%s","Parsing Unsuccessfull\n");
    fprintf(yyout,"%s\n","Parsing Unsuccessfull\n");
}

