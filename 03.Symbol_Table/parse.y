%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
    void yyerror(const char *s);
    int yylex();
    int yywrap();
    void add(char);
    void insert_type();
    int search(char *);
    void insert_type();

    struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
    } symbol_table[40];

    int count=0;
    int q;
    char type[10];
    extern int countn;
%}

%token VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY INCLUDE RETURN 

%%

program: headers main '(' ')' '{' body return '}'
;

headers: headers headers
| INCLUDE { 
	add('H'); 
	}
;

main: datatype ID { 
	add('F'); 
	}
;

datatype: INT { 
	insert_type(); 
	}
| FLOAT { 
	insert_type(); 
	}
| CHAR { 
	insert_type();
	 }
| VOID { 
	insert_type(); 
	}
;

body: FOR { add('K'); } '(' statement ';' condition ';' statement ')' '{' body '}'
| IF { add('K'); } '(' condition ')' '{' body '}' else
| statement ';'
| body body 
| PRINTFF { add('K'); } '(' STR ')' ';'
| SCANFF { add('K'); } '(' STR ',' '&' ID ')' ';'
;

else: ELSE { add('K'); } '{' body '}'
|
;

condition: value relop value 
| TRUE { add('K'); }
| FALSE { add('K'); }
|
;

statement: datatype ID { add('V'); } init
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

value: NUMBER { add('C'); }
| FLOAT_NUM { add('C'); }
| CHARACTER { add('C'); }
| ID
;

return: RETURN { add('K'); } value ';'
|
;

%%

int main() {
	extern FILE *yyout;
    yyout=fopen("Output_ques3.txt","w");
  yyparse();
  printf("\n");
  fprintf(yyout,"\n");
  fprintf(yyout,"\n");
  printf("\n");
	printf("\t\t\t\t\t PHASE 1: LEXICAL ANALYSIS \t\t\t \n\n");
	fprintf(yyout,"\t\t\t\t\t PHASE 1: LEXICAL ANALYSIS \t\t\t \n\n");
	printf("\nLEXEME    DATATYPE   SYMBOL TYPE \n");
	fprintf(yyout,"\nLEXEME    DATATYPE   SYMBOL TYPE \n");
	printf("_______________________________________");
	fprintf(yyout,"_______________________________________");
	printf("\n");
	printf("\n");
	fprintf(yyout,"\n");
    fprintf(yyout,"\n");
	int i=0;
	while(i<count){
		printf("%s",symbol_table[i].id_name);
		fprintf(yyout,"%s",symbol_table[i].id_name);
		printf("\t%s",symbol_table[i].data_type);
		fprintf(yyout,"\t%s",symbol_table[i].data_type);
		printf("\t%s\n",symbol_table[i].type);
		fprintf(yyout,"\t  %s\n",symbol_table[i].type);
		i++;
	}
	int cn=0;
	while(cn<count){
		free(symbol_table[i].id_name);
		free(symbol_table[i].type);
		cn++;
	}
	printf("\n");
	printf("\n");
}

int search(char *type) {
	int i;
	for(i=count-1; i>=0; i--) {
		if(strcmp(symbol_table[i].id_name, type)==0) {
			return -1;
			break;
		}
	}
	return 0;
}

void add(char c) {
  q=search(yytext);
  if(!q) {
    if(c == 'H') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("HEADER");
			symbol_table[count].data_type=strdup("N/A");
			count++;
		}
		else if(c == 'K') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("KEYWORD\t");
			symbol_table[count].data_type=strdup("N/A");
			count++;
		}
		else if(c == 'V') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("IDENTIFIER");
			symbol_table[count].data_type=strdup(type);
			count++;
		}
		else if(c == 'C') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("CONSTANT");
			symbol_table[count].data_type=strdup("int");
			count++;
		}
		else if(c == 'F') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("KEYWORD");
			symbol_table[count].data_type=strdup(type);
			count++;
		}
	}
}

void insert_type() {
	strcpy(type, yytext);
}

void yyerror(const char* msg) {
	printf("%s","Error in generating symbol table");
	fprintf(yyout,"%s","Error in generating symbol table");
    fprintf(stderr, "%s\n", msg);
}