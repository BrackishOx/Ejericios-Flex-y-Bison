%{
#include <stdio.h>

int yylex(void);
int yyerror(char *s);
%}


%%

input:
    | input '\n'
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error\n");
    return 0;
}
