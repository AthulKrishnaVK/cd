%{
    #include <stdio.h>
    int valid = 1;  
    int yyerror();  
%}

%token letter digit

%%

start: letter s {  
    if (valid) {
        printf("\nIt is a valid identifier!\n");
    }
}
;

s: letter s  {  
    if (!valid) { valid = 0; }
}
| digit s   {  
    if (!valid) { valid = 0; }
}
|           { 
}
;

%%

int yyerror() {
    printf("\nIt's not a valid identifier!\n");
    valid = 0;  
    return 0;
}

int main() {
    printf("\nEnter a name to test for identifier: ");
    yyparse();  
    if (valid) {
        printf("\nIt is a valid identifier!\n");
    }
}

