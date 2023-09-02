%{

    #include "y.tab.h"

%}



alpha [a-zA-Z]

digit [0-9]

unary "++"|"--"



%%

[0-9]+ {yylval=atoi(yytext);return TAMSAYI;}

"yazdir"                    { return YAZDIR; }

"tara"                     { return TARA; }

"int"                       { return INT; }

"float"                     { return FLOAT; }

"char"                      { return CHAR; }

"return"                    { return RETURN; }

"for"	                    { return FOR; }

"if"	                    { return IF; }

"else"	                    { return ELSE; }

^"#include"[ ]*<.+\.h>      { return INCLUDE; }

"true"                      { return TRUE; }

"false"                     { return FALSE; }

[-]?{digit}+                { return NUMBER; }

[-]?{digit}+\.{digit}{1,6}  { return FLOAT_NUM; }

{alpha}({alpha}|{digit})*   { return ID; }

{unary}                     { return UNARY; }

"<<="                        { return LE; }

">>="                        { return GE; }

"==="                        { return EQ; }

"!=!"                        { return NE; }

">>"	                    { return GT; }

"<<"	                    { return LT; }

"/-/"	                    { return AND; }

"|-|"	                    { return OR; }

"t+"                         { return TOPLA; }

"t-"                         { return CIKAR; }

"t/"                         { return BOL; }

"t*"                         { return CARP; }

"t%"			     {return MOD;}

\/\/.*                      { ; }

\/\*(.*\n)*.*\*\/           { ; } 

[ \t]*                      { ; }

[\n]                        { countn++; }

.	                    { return *yytext; }

["].*["]                    { return STR; }

['].[']                     { return CHARACTER; }



%%



int yywrap() {

    return 1;

}