%{
#include <stdio.h>
#include <string.h>

int iErr = 0;
%}

%token EDGE_SEP BLOCK_START BLOCK_END COMMENT DEFAULT_CHAR ERROR
%token NUMBER
%token SHAPE
%token STYLE
%token TEXT
%token COLOR

%%

main:
  comment
  defaults
  BLOCK_START nodes BLOCK_END
  BLOCK_START edges BLOCK_END
  ;

comment:
  | comment COMMENT
  ;

defaults:
  | DEFAULT_CHAR SHAPE STYLE { }
  | DEFAULT_CHAR STYLE SHAPE { }
  ;

nodes:
  | nodes node
  ;

node:
  NUMBER SHAPE STYLE TEXT { }
  | NUMBER SHAPE STYLE COLOR TEXT { }
  | NUMBER SHAPE STYLE { }
  | NUMBER SHAPE STYLE COLOR { }
  | NUMBER STYLE SHAPE TEXT { }
  | NUMBER STYLE SHAPE COLOR TEXT { }
  | NUMBER STYLE SHAPE { }
  | NUMBER STYLE SHAPE COLOR { }
  | NUMBER STYLE TEXT { }
  | NUMBER STYLE COLOR TEXT { }
  | NUMBER STYLE { }
  | NUMBER STYLE COLOR { }
  | NUMBER SHAPE TEXT { }
  | NUMBER SHAPE COLOR TEXT { }
  | NUMBER SHAPE { }
  | NUMBER SHAPE COLOR { }
  | NUMBER TEXT { }
  | NUMBER COLOR TEXT { }
  | NUMBER { }
  | NUMBER COLOR { }
  ;

edges:
  | edges edge
  ;

edge:
  NUMBER EDGE_SEP NUMBER STYLE TEXT { }
  | NUMBER EDGE_SEP NUMBER STYLE COLOR TEXT { }
  | NUMBER EDGE_SEP NUMBER STYLE { }
  | NUMBER EDGE_SEP NUMBER COLOR STYLE { }
  | NUMBER EDGE_SEP NUMBER TEXT { }
  | NUMBER EDGE_SEP NUMBER COLOR TEXT { }
  | NUMBER EDGE_SEP NUMBER { }
  | NUMBER EDGE_SEP NUMBER COLOR { }
  ;

%%

void yyerror(char *s)
{
  extern int yylineno;
  extern char *yytext;
  fprintf(stderr, "ERROR: %s at symbol '%s' on line %d\n", s, yytext, yylineno);
  iErr = -1;
}

int main(void)
{
  yyparse();
  if (!iErr)
    {
      printf("Valid graph\n");
    }
  return iErr;
}
