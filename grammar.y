%{
#include<stdio.h>
#include<stdlib.h>

extern int yylex();
%}

%union{
	float f;
}

%token <f> NUM //this is a terminal 
%type <f> E T F 

%%

S : E		{printf("%f\n", $1);}
  ;

E : E '+' T	{$$ = $1 + $3;}
  | E '-' T	{$$ = $1 - $3;}
  | T		{$$ = $1;}
  ;

T : T '*' F	{$$ = $1*$3;}
  | T '/' F	{$$ = $1/$3;}
  | F		{$$ = $1;}
  ;

F : '(' E ')'	{$$ = $2;}
  | '-' F	{$$ = -$2;}
  | NUM		{$$ = $1;}
  ;

%%

void yyerror(char * e){
	fprintf(stderr," you have made an error %s",e);
	exit(1);
}

int main()
{
	yyparse();

return 0;
} 
