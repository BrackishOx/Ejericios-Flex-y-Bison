%{
#include <stdio.h>
%}

%%

[0-9]+      { printf("Numero: %s\n", yytext); }
[a-zA-Z]+   { printf("Palabra: %s\n", yytext); }
\n          ;
.           ;

%%

int main() {
    yylex();
    return 0;
}
