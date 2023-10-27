<body>
<h1>Programming Assignment - Lex and Yacc</h1>
<h2>Project Overview</h2>
<p>This programming assignment is designed to help you become familiar with Lex and Yacc. The primary objectives of this project are as follows:</p>
<ol>
  <li>Write a Lex program to generate tokens for the C language.</li>
  <li>Define a grammar for the C language and write a Yacc program to check if your grammar can successfully parse any given C program.</li>
  <li>Develop a Yacc program to generate the symbol table for a C program if it can be successfully parsed.</li>
  <li>Create a Yacc program to generate the syntax tree for any C program.</li>
</ol>
<p>A sample input file, "input.c," is provided with the assignment for testing purposes.</p>
<h2>Project Structure</h2>
<p>The project directory structure is as follows:</p>
<pre>
lex_yacc
    -- 01. Token Generator
    -- 02. Parser
    -- 03. Symbol Tree Generator
    -- 04. Syntax Tree Generator
</pre>
<h2>System Requirements</h2>
<p>To run this project, you need the following:</p>
<ul>
  <li>Linux environment with Flex (for Lex) and Bison (for Yacc) packages installed.</li>
  <li>GCC compiler</li>
  <li>Bash shell to run the provided scripts</li>
</ul>
<h2>Instructions</h2>
<p>To run the programs, follow these instructions for each part of the assignment:</p>

<h3>For Part 1: Token Generator</h3>
<pre>
$ cd 01.Token\ Generator
$ lex lexer.l
$gcc lex.yy.c -o generator
$./generator < input.c
</pre>

<h3>For Part 2: Parser</h3>
<pre>
$ cd 02.Parser
$ lex lex.l
$ yacc -d parse.y
$ gcc -w y.tab.c -o parser
$ ./parser < input.c
</pre>

<h3>For Part 3: Symbol Tree Generator</h3>
<pre>
$ cd 03.Symbol\ Tree\ Generator
$ lex lex.l
$ yacc -d parse.y
$ gcc -w y.tab.c -o symbol_gen
$ ./symbol_gen < input.c
</pre>

<h3>For Part 4: Syntax Tree Generator</h3>
<pre>
$ cd 04.Syntax\ Tree\ Generator
$ lex lex.l
$ yacc -d parse.y
$ gcc -w y.tab.c -o syntax_gen
$ ./syntax_gen<input.c
</pre>

<h2>Notes</h2>
<ul>
  <li>All required outputs are displayed on the terminal and copied to respective output files in the respective directories (e.g., Output.txt for question 1).</li>
  <li>The provided sample outputs are based on the "input.c" program.</li>
  <li>If you wish to change the input, either change the script input file or edit the "input.c".</li>
  <li>The code has been tested on a Linux environment; bison 2.3 must be installed.</li>
</ul>
<h2>Project Background</h2>
<p>This project involves using Lex for token generation and Yacc for parsing C language programs. Lex generates tokens by matching patterns in the input, while Yacc creates a parse tree based on the tokens produced by Lex.</p>
<h2>Assumptions</h2>
<p>The project assumes the following about the input C programs:</p>
<ul>
  <li>Programs contain optional headers followed by a single main function with statements. Both single-line and multi-line comments are allowed.</li>
  <li>Statements include declarative, iterative, conditional, assignment, update statements, "printf" and "scanf" functions, and return statements. An empty statement (";") is also allowed.</li>
  <li>Iterative statements include for loops and while loops with specific syntax requirements.</li>
  <li>Expressions allow binary arithmetic operators, negation, multiple variables, and constants.</li>
  <li>Conditions include single relational operators, negation, and two operands (identifiers or constants).</li>
  <li>The project uses a bottom-up parser and prints the post-order traversal of the parse tree for question 4.</li>
</ul>
<h2>References</h2>
<ul>
  <li><a href="#">Part 01: Tutorial on Lex/Yacc</a></li>
  <li><a href="#">Part 02: Tutorial on Lex/Yacc</a></li>
  <li><a href="#">http://osr507doc.sco.com/en/tools/Yacc_precedence_assigning.html</a></li>
</ul>
</body>
