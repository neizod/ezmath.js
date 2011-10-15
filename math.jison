/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex
%%

"+-"            %{ yytext = "\\pm";         return 'SYMBOL'; %}
"-+"            %{ yytext = "\\mp";         return 'SYMBOL'; %}

"+"             %{ yytext = "+";            return 'SYMBOL'; %}
"-"             %{ yytext = "-";            return 'SYMBOL'; %}
"*"             %{ yytext = "\\times";      return 'SYMBOL'; %}
"."             %{ yytext = "\\cdot";       return 'SYMBOL'; %}
"ast"           %{ yytext = "*";            return 'SYMBOL'; %}
"//"            %{ yytext = "\\div";        return 'SYMBOL'; %}

"(+)"           %{ yytext = "\\oplus";      return 'SYMBOL'; %}
"(-)"           %{ yytext = "\\ominus";     return 'SYMBOL'; %}
"(*)"           %{ yytext = "\\otimes";     return 'SYMBOL'; %}
"(.)"           %{ yytext = "\\odot";       return 'SYMBOL'; %}
"(ast)"         %{ yytext = "\\circleast";  return 'SYMBOL'; %}
"(/)"           %{ yytext = "\\oslash";     return 'SYMBOL'; %}

"~"             %{ yytext = "\\sim";        return 'SYMBOL'; %}
"deg"("ree")?   %{ yytext = "{^\\circ}";    return 'SYMBOL'; %}
"star"          %{ yytext = "\\star";       return 'SYMBOL'; %}

"||"            %{ yytext = "\\|";          return 'SYMBOL'; %}
"|"             %{ yytext = "|";            return 'SYMBOL'; %}



"="             { yylval = (int)"="; return SEQV; }
"=="            { yylval = (int)"\\equiv"; return SEQV; }
"~="            { yylval = (int)"\\cong"; return SEQV; }
"~~"            { yylval = (int)"\\approx"; return SEQV; }
"propto"        { yylval = (int)"\\propto"; return SEQV; }
"!="            { yylval = (int)"\\neq"; return SEQV; }
"<"             { yylval = (int)"\\lt"; return SEQV; }
">"             { yylval = (int)"\\gt"; return SEQV; }
"<<"            { yylval = (int)"\\ll"; return SEQV; }
">>"            { yylval = (int)"\\gg"; return SEQV; }
"<="            { yylval = (int)"\\leq"; return SEQV; }
">="            { yylval = (int)"\\geq"; return SEQV; }
"-<"            { yylval = (int)"\\prec"; return SEQV; }
">-"            { yylval = (int)"\\succ"; return SEQV; }

"and"           { yylval = (int)"\\land"; return SLGC; }
"or"            { yylval = (int)"\\lor"; return SLGC; }
"not"           { yylval = (int)"\\neg"; return SLGC; }
"<->"           { yylval = (int)"\\leftrightarrow"; return SLGC; }
"<-->"          { yylval = (int)"\\longleftrightarrow"; return SLGC; }
"->"            { yylval = (int)"\\rightarrow"; return SLGC; }
"-->"           { yylval = (int)"\\longrightarrow"; return SLGC; }
"<-"            { yylval = (int)"\\leftarrow"; return SLGC; }
"<--"           { yylval = (int)"\\longleftarrow"; return SLGC; }
"<=>"           { yylval = (int)"\\Leftrightarrow"; return SLGC; }
"<==>"          { yylval = (int)"\\Longleftrightarrow"; return SLGC; }
"=>"            { yylval = (int)"\\Rightarrow"; return SLGC; }
"==>"           { yylval = (int)"\\Longrightarrow"; return SLGC; }
"<=="           { yylval = (int)"\\Longleftarrow"; return SLGC; }
"|->"           { yylval = (int)"\\mapsto"; return SLGC; }

"..."           { yylval = (int)"\\ldots"; return SOTH; }
("I"|"i")"nf"("ini")?"ty"   { yytext = "\\infty"; return 'i'; }





\s+                   /* skip whitespace */
<<EOF>>               return 'EOF'
.                     return 'INVALID'

/lex

/* =============================================================== */

%% /* language grammar */

expressions
: e EOF
  { return $1; }
;

e
: SYMBOL
  { $$ = yytext; }
;

