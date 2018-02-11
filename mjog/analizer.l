%{
#include "analizer.tab.h"

%}

%option yylineno

%%

^[/]{2}.*$ {
  return COMMENT;
}

^"#" {
  return DEFAULT_CHAR;
}

\'[^\']+\' {
  return TEXT;
}

[0-9]+ {
  return NUMBER;
}
"box"|"circle"|"text"|"hexagon" {
  return SHAPE;
}
"solid"|"dotted"|"bold"|"dashed" {
  return STYLE;
}
"red"|"green"|"blue"|"black"|"yellow"|"orange" {
  return COLOR;
}
"->" {
  return EDGE_SEP;
}
"{" {
  return BLOCK_START;
}
"}" {
  return BLOCK_END;
}
[ \t\n]+ ;

. { return ERROR;};

%%
