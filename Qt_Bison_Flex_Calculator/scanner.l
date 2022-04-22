%{
#include <cstdlib>
#include "parser.h"

int yylex();
void yyerror(const char *s);
%}

%option header-file="scanner.h"
%option outfile="scanner.cpp"
%option noyywrap
%option nounput

%%

[0-9]+(\.[0-9]+)? {yylval.dval=atof(yytext);   return NUMBER;}
[ \t] ;
\n    {return  0;}
.     {return  yytext[0];}
%%
