%{
     #include<stdio.h>
%}


%option noyywrap

%%

    //Pre-processor directive
#.*                            {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}

    //Delimiter
[''|,|;(|)|{|}|.|_]            {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}

    //Delimiter
[[]]                           {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}

    //Special Characters
"#"|"@"|"$"|"^"|"%"|"^"|"&"    {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}

    //Delimiter
"["|"]"                        {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Assignment Operator
"="                            {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Arithmatic Operator
"+"|"-"|"*"|"/"                {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Logical Operators
"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"  {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Relational Operator
"<="|">="|"++"|"!="|"=="|"<"|">"            {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Keyword
("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF")        {
                                            fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Keyword
("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("unsigned")|("void")|("static")|("struct")|("goto")  {
                                            fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //Identifier
[a-zA-Z_][a-zA-Z0-9_]*                      {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //fraction
[0-9]*"."[0-9]+                             {fprintf(yyout,"%d %s\n",yylineno,yytext);printf("%d %s\n\n",yylineno,yytext);} 


    //negative fraction
[-][0-9]*"."[0-9]+                          {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);} 


    //integer
[0-9]+                                      {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //negative integer
"-"[0-9]+                                    {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}


    //string
["]([^"\\\n]|\\.|\\\n)*["]                   {fprintf(yyout,"%d %s\n",yylineno,yytext); printf("%d %s\n\n",yylineno,yytext);}

    // single line comments
"//".*" "*                                   { ; }

    // multi line comments
\/\*(.*\n)*.*\*\/                            { ; }

.                                            {fprintf(yyout,"",yytext);}

"\n"|"\r"                                    {yylineno++;}
[\t\n]+                                      {yylineno =yylineno+ 2;}

%%

int main(int argc, char * argv[])
{
    extern FILE *yyi, *yyout; 
    yyin=fopen(argv[1], "r");
    yyout = fopen("Output_ques1.txt", "w"); 

    printf("The tokens generatedd by the lexer are - \n\n");
    
    yylex();	
    return 0; 
}