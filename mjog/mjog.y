%{
#include <stdio.h>
#include <string.h>

char def_style[25] = "solid";
char def_shape[25] = "box";
%}

%union
{
  char *sval;
};
%token EDGE_SEP BLOCK_START BLOCK_END COMMENT DEFAULT_CHAR ERROR
%token <sval> NUMBER
%token <sval> SHAPE
%token <sval> STYLE
%token <sval> TEXT
%token <sval> COLOR

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
  | DEFAULT_CHAR SHAPE STYLE { strcpy(def_style, $3); strcpy(def_shape, $2); }
  | DEFAULT_CHAR STYLE SHAPE { strcpy(def_style, $2); strcpy(def_shape, $3); }
  ;

nodes:
  | nodes node
  ;

node:
  NUMBER SHAPE STYLE TEXT { printf("%s [shape=%s] [style=%s] [label=%s];\n", $1, $2, $3, $4); }
  | NUMBER SHAPE STYLE COLOR TEXT { printf("%s [shape=%s] [style=%s] [color=%s] [label=%s];\n", $1, $2, $3, $4, $5); }
  | NUMBER SHAPE STYLE { printf("%s [shape=%s] [style=%s];\n", $1, $2, $3); }
  | NUMBER SHAPE STYLE COLOR { printf("%s [shape=%s] [style=%s] [color=%s];\n", $1, $2, $3, $4); }
  | NUMBER STYLE SHAPE TEXT { printf("%s [shape=%s] [style=%s] [label=%s];\n", $1, $3, $2, $4); }
  | NUMBER STYLE SHAPE COLOR TEXT { printf("%s [shape=%s] [style=%s] [color=%s] [label=%s];\n", $1, $3, $2, $4, $5); }
  | NUMBER STYLE SHAPE { printf("%s [shape=%s] [style=%s];\n", $1, $3, $2); }
  | NUMBER STYLE SHAPE COLOR { printf("%s [shape=%s] [style=%s] [color=%s];\n", $1, $3, $2, $4); }
  | NUMBER STYLE TEXT { printf("%s [shape=%s] [style=%s] [label=%s];\n", $1, def_shape, $2, $3); }
  | NUMBER STYLE COLOR TEXT { printf("%s [shape=%s] [style=%s] [color=%s] [label=%s];\n", $1, def_shape, $2, $3, $4); }
  | NUMBER STYLE { printf("%s [shape=%s] [style=%s];\n", $1, def_shape, $2); }
  | NUMBER STYLE COLOR { printf("%s [shape=%s] [style=%s] [color=%s];\n", $1, def_shape, $2, $3); }
  | NUMBER SHAPE TEXT { printf("%s [shape=%s] [style=%s] [label=%s];\n", $1, $2, def_style, $3); }
  | NUMBER SHAPE COLOR TEXT { printf("%s [shape=%s] [style=%s] [color=%s] [label=%s];\n", $1, $2, def_style, $3, $4); }
  | NUMBER SHAPE { printf("%s [shape=%s] [style=%s];\n", $1, $2, def_style); }
  | NUMBER SHAPE COLOR { printf("%s [shape=%s] [style=%s] [color=%s] ;\n", $1, $2, def_style, $3); }
  | NUMBER TEXT { printf("%s [shape=%s] [style=%s] [label=%s];\n", $1, def_shape, def_style, $2); }
  | NUMBER COLOR TEXT { printf("%s [shape=%s] [style=%s] [color=%s] [label=%s];\n", $1, def_shape, def_style, $2, $3); }
  | NUMBER { printf("%s [shape=%s] [style=%s];\n", $1, def_shape, def_style); }
  | NUMBER COLOR { printf("%s [shape=%s] [style=%s] [color=%s];\n", $1, def_shape, def_style, $2); }
  ;

edges:
  | edges edge
  ;

edge:
  NUMBER EDGE_SEP NUMBER STYLE TEXT { printf("%s -- %s [style=%s] [label=%s];\n", $1, $3, $4, $5); }
  | NUMBER EDGE_SEP NUMBER STYLE COLOR TEXT { printf("%s -- %s [style=%s] [label=%s] [color=%s];\n", $1, $3, $4, $5, $6); }
  | NUMBER EDGE_SEP NUMBER STYLE { printf("%s -- %s [style=%s];\n", $1, $3, $4); }
  | NUMBER EDGE_SEP NUMBER COLOR STYLE { printf("%s -- %s [style=%s] [color=%s];\n", $1, $3, $4, $5); }
  | NUMBER EDGE_SEP NUMBER TEXT { printf("%s -- %s [style=%s] [label=%s];\n", $1, $3, def_style, $4); }
  | NUMBER EDGE_SEP NUMBER COLOR TEXT { printf("%s -- %s [style=%s] [label=%s] [color=%s];\n", $1, $3, def_style, $4, $5); }
  | NUMBER EDGE_SEP NUMBER { printf("%s -- %s [style=%s];\n", $1, $3, def_style); }
  | NUMBER EDGE_SEP NUMBER COLOR { printf("%s -- %s [style=%s] [color=%s];\n", $1, $3, def_style, $4); }
  ;

%%

void yyerror(char *s)
{
  extern int yylineno;
  extern char *yytext;
  fprintf(stderr, "ERROR: %s at symbol '%s' on line %d\n", s, yytext, yylineno);
}

int main(void)
{
  printf("graph mjog {\n");
  yyparse();
  printf("}\n");
  return 0;
}
