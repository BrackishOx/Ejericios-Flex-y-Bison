%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char *s);
%}

%token NUMBER

%%

input:
      /* vacío */
    | input line
    ;

line:
      '\n'
    | expr '\n'  { printf("= %d\n", $1); }
    ;

expr:
      NUMBER
    | expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    ;

%%

int main() {
    printf("Calculadora simple (+ -)\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

