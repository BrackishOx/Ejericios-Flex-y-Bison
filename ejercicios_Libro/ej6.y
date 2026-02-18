%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUM

%left '+' '-'
%left '*' '/'
%right '^'

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
    | expr '^' expr {
          int result = 1;
          for(int i = 0; i < $3; i++)
              result *= $1;
          $$ = result;
      }
    ;

%%

int main() {
    printf("Calculadora con potencia\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
