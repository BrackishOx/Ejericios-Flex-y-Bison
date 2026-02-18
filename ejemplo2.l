%{
#include <stdio.h>
int lineas = 0;
%}

%%

\n      { lineas++; }
.       ;

%%

int main() {
    yylex();
    printf("Total lineas: %d\n", lineas);
    return 0;
}
