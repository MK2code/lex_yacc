%{
     #include<stdio.h>
%}


%option noyywrap

%%

#.* {                               //Pre-processor directive
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

[''|,|;(|)|{|}|.|_] {              //Delimiter
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

[[]] {        //Delimiter
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"#"|"@"|"$"|"^"|"%"|"^"|"&" {               //Special Characters
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"["|"]" {                 //Delimiter
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }


"="  {                               // Assignment Operator
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }


"+"|"-"|"*"|"/"  {                    //Arithmatic Operator
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"  {            //Logical Operators
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"<="|">="|"++"|"!="|"=="|"<"|">"  {                      //Relational Operator
    fprintf(yyout,"%d %s\n",yylineno,yytext);printf("%d %s\n\n",yylineno,yytext);
    }

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF") {          //Keyword
    fprintf(yyout,"%d %s\n",yylineno,yytext);printf("%d %s\n\n",yylineno,yytext);
    }

("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("unsigned")|("void")|("static")|("struct")|("goto")
 {                    //Keyword
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

[a-zA-Z_][a-zA-Z0-9_]* {     //Identifier
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

[0-9]*"."[0-9]+ {       //fraction
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    } 

[-][0-9]*"."[0-9]+ {        //negative fraction
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    } 

[0-9]+ {      //integer
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"-"[0-9]+ {        //negative integer
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

["]([^"\\\n]|\\.|\\\n)*["] {     //string
    fprintf(yyout,"%d %s\n",yylineno,yytext);
    printf("%d %s\n\n",yylineno,yytext);
    }

"//".*" "*   // single line comments

\/\*(.*\n)*.*\*\/   // multi line comments

. {
    fprintf(yyout,"",yytext);
    }

"\n"|"\r" {yylineno++;}
[\t\n]+ {yylineno =yylineno+ 2;}

%%

int main(int argc, char * argv[])
{
    extern FILE *yyin;
    extern FILE  *yyout; 
    yyin=fopen(argv[1], "r");
    yyout = fopen("Output.txt", "w"); 
    yylex();	
    return 0; 
}