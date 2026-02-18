%{
#include <stdio.h>
int chars = 0, words = 0, lines = 0;
%}

%%

\n              { chars++; lines++; }
[a-zA-Z]+       { chars += yyleng; words++; }
.               { chars++; }

%%

int main() {
    yylex();
    printf("Caracteres: %d\n", chars);
    printf("Palabras: %d\n", words);
    printf("Lineas: %d\n", lines);
    return 0;
}
