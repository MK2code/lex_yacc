Language Processing - 

Source File       ---(Scanner/lexical analysis)----->   Token Stream

Token Stream      -----(parser/syntax analysis)----->   Parse Tree

Parse Tree        ------(Semantic Analysis)------>      Syntax Tree


Lex/Flex - 
    input  = regular expressions (.c)  
    output = table (lex.yy.c)
    