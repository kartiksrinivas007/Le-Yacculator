NUMBER [0-9](\.[0-9]+)?([eE][0-9]+)?
BINOP [+-/*] 
SPACE [ \t\n\f\v] 

%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%option noyywrap 

%%
{NUMBER} {yylval.f = atof(yytext); return NUM;}
{BINOP}  {return yytext[0];}
{SPACE}  {;}
