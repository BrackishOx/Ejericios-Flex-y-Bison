%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(char *s);
%}

%token NUM

%left '+' '-'
%left '*' '/'
%left '(' ')'

%%

input:
      /* vacío */
    | input line
    ;

line:
      '\n'
    | expr '\n' { printf("= %d\n", $1); }
    ;

expr:
      NUM
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    ;

%%

int main() {
    printf("Calculadora avanzada\n");
    yyparse();
    return 0;
}

void yyerror(char *s) {
    printf("Error: %s\n", s);
}
