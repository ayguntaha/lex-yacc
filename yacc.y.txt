%{

    #include<stdio.h>

    #include<string.h>

    #include<stdlib.h>

    #include<ctype.h>

    #include"lex.yy.c"

    

    void yyerror(const char *s);

    int yylex();

    int yywrap();

%}



%token TAMSAYI 

       CHARACTER 

       YAZDIR 

       TARA

       INT

       FLOAT 

       CHAR

       FOR 

       IF

       ELSE

       TRUE

       FALSE 

       NUMBER UNARY STR 

       FLOAT_NUM

       ID LE GE EQ NE GT LT 

       AND OR 

       TOPLA CARP BOL CIKAR MOD 

       INCLUDE RETURN 



%%



program: headers main '[' ']' '(' body return ')'

;



headers: headers headers

| INCLUDE

;



main: datatype ID

;



datatype: INT 

| FLOAT 

| CHAR

;



body: FOR '[' durum '-' condition '-' durum ']' '(' body ')'

| IF '[' condition ']' '(' body ')' else

| durum ';' 

| body body

| YAZDIR '[' STR ']' ';'

| TARA '[' STR ';' 'T' ID ']' ';'

;



else: ELSE '{' body '}'

|

;



condition: value relop value 

| TRUE 

| FALSE

;



durum: datatype ID init 

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



arithmetic: TOPLA 

| CIKAR 

| CARP

| BOL

| MOD

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

    yyparse();

}



void yyerror(const char* msg) {

    fprintf(stderr, "%s\n", msg);

}