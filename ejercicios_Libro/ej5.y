%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUM

%left '+' '-'
%left '*' '/'

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
    | expr '/' expr {
          if ($3 == 0) {
              printf("Error: division por cero\n");
              $$ = 0;
          } else {
              $$ = $1 / $3;
          }
      }
    ;

%%

int main() {
    printf("Calculadora con division segura\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
