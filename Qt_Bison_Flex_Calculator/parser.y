%{
#include "common.h"
#include "math.h"
#include<stdio.h>

int yylex();
void yyerror(const char *s);

elements_t parsedElements;
int lineno;

%}

%defines "parser.h"
%output "parser.cpp"
%define parse.error verbose

%union{
    double dval;
    }
%token <dval> NUMBER;
%left '+' '-'
%left '/' '*'
%right '^'
%type <dval> expr
%%
result: expr {parsedElements << ParseElement{$1};}
;
expr:
    expr '+' expr { $$=$1+$3;}
    | expr '-' expr { $$=$1-$3;}
    | expr '*' expr { $$=$1*$3;}
    | expr '/' expr { if($3==0)
                        yyerror("CANNOT DIVIDE BY ZERO");
                    else
                        $$=$1/$3;
                    }
    | '-'expr { $$=-$2;}
    | '(' expr ')' { $$=$2;}
    | NUMBER {$$=$1;}
    ;
%%

void yyerror(const char *s) {
    yyclearin;
    throw ParserException{lineno, QString(s)};
}

//result: expr { printf("RESULT IS %f",$1);}
//;

// parsedElements << ParseElement{$2, static_cast<Qt::AlignmentFlag>($4)};
