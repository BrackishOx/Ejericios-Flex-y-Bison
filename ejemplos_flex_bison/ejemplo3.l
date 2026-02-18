%{
#include "ejemplo3.tab.h"
%}

%%

\n      return '\n';
.       return yytext[0];

%%

int yywrap() {
    return 1;
}
