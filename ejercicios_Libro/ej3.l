%{
#include <stdio.h>
%}

%%

"/*"([^*]|"*"+[^*/])*"*"+"/"   { }
.|\n                            { printf("%s", yytext); }

%%

int main() {
    yylex();
    return 0;
}
