%{
#include "mjog.tab.h"

char* check_text(char *text);
char* get_type(char *text);
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
  yylval.sval = check_text(strdup(yytext));
  return TEXT;
}

[0-9]+ {
  yylval.sval = strdup(yytext);
  return NUMBER;
}
"box"|"circle"|"text"|"hexagon" {
  yylval.sval = strdup(get_type(yytext));
  return SHAPE;
}
"solid"|"dotted"|"bold"|"dashed" {
  yylval.sval = strdup(get_type(yytext));
  return STYLE;
}
"red"|"green"|"blue"|"black"|"yellow"|"orange" {
  yylval.sval = strdup(get_type(yytext));
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

char* check_text(char *text)
{
  size_t buf_size = strlen(text);
  char buf[buf_size+1];
  int i = 0, j = 0;
  for (i=0; i<buf_size; ++i)
    {
      switch(text[i])
	{
	case '\'':
	  if (i == 0 || i == buf_size-1)
	    {
	      buf[j] = '"';
	      j++;
	    }
	case '"':
	case '[':
	case ']':
	  break;
	default:
	    buf[j] = text[i];
	    j++;
	  break;
	}
    }
  buf[j] = '\0';
  strcpy(text, buf);
  return text;
}

char* get_type(char *text)
{
  static char buf[1024];
  if (strcmp(text, "box") == 0)
    {
      strcpy(buf, "box");
    }
  else if (strcmp(text, "circle") == 0)
    {
      strcpy(buf, "circle");
    }
  else if (strcmp(text, "text") == 0)
    {
      strcpy(buf, "plaintext");
    }
  else if (strcmp(text, "hexagon") == 0)
    {
      strcpy(buf, "hexagon");
    }
  else if (strcmp(text, "dashed") == 0)
    {
      strcpy(buf, "dashed");
    }
  else if (strcmp(text, "solid") == 0)
    {
      strcpy(buf, "solid");
    }
  else if (strcmp(text, "dotted") == 0)
    {
      strcpy(buf, "dotted");
    }
  else if (strcmp(text, "bold") == 0)
    {
      strcpy(buf, "bold");
    }
  else
    {
      if (strlen(text) < 1024)
	{
	  strcpy(buf, text);
	}
      else
	{
	  buf[0] = '\0';
	}
    }
  return buf;
}
