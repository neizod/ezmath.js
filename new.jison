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
("ast")         %{ yytext = "*";            return 'SYMBOL'; %}
"//"            %{ yytext = "\\div";        return 'SYMBOL'; %}

"(+)"           %{ yytext = "\\oplus";      return 'SYMBOL'; %}
"(-)"           %{ yytext = "\\ominus";     return 'SYMBOL'; %}
"(*)"           %{ yytext = "\\otimes";     return 'SYMBOL'; %}
"(.)"           %{ yytext = "\\odot";       return 'SYMBOL'; %}
"(ast)"         %{ yytext = "\\circleast";  return 'SYMBOL'; %}
"(/)"           %{ yytext = "\\oslash";     return 'SYMBOL'; %}

"~"             %{ yytext = "\\sim";        return 'SYMBOL'; %}
("deg"("ree")?) %{ yytext = "{^\\circ}";    return 'SYMBOL'; %}
("star")        %{ yytext = "\\star";       return 'SYMBOL'; %}

"||"            %{ yytext = "\\|";          return 'SYMBOL'; %}
"|"             %{ yytext = "|";            return 'SYMBOL'; %}


"="             %{ yytext = "=";            return 'SYMBOL'; %}
"=="            %{ yytext = "\\equiv";      return 'SYMBOL'; %}
"~="            %{ yytext = "\\cong";       return 'SYMBOL'; %}
"~~"            %{ yytext = "\\approx";     return 'SYMBOL'; %}
"propto"        %{ yytext = "\\propto";     return 'SYMBOL'; %}
"!="            %{ yytext = "\\neq";        return 'SYMBOL'; %}
"<"             %{ yytext = "\\lt";         return 'SYMBOL'; %}
">"             %{ yytext = "\\gt";         return 'SYMBOL'; %}
"<<"            %{ yytext = "\\ll";         return 'SYMBOL'; %}
">>"            %{ yytext = "\\gg";         return 'SYMBOL'; %}
"<="            %{ yytext = "\\leq";        return 'SYMBOL'; %}
">="            %{ yytext = "\\geq";        return 'SYMBOL'; %}
"-<"            %{ yytext = "\\prec";       return 'SYMBOL'; %}
">-"            %{ yytext = "\\succ";       return 'SYMBOL'; %}

"and"           %{ yytext = "\\land";       return 'SYMBOL'; %}
"or"            %{ yytext = "\\lor";        return 'SYMBOL'; %}
"not"           %{ yytext = "\\neg";        return 'SYMBOL'; %}
"<->"           %{ yytext = "\\leftrightarrow";        return 'SYMBOL'; %}
"<-->"          %{ yytext = "\\longleftrightarrow";    return 'SYMBOL'; %}
"->"            %{ yytext = "\\rightarrow";            return 'SYMBOL'; %}
"-->"           %{ yytext = "\\longrightarrow";        return 'SYMBOL'; %}
"<-"            %{ yytext = "\\leftarrow";             return 'SYMBOL'; %}
"<--"           %{ yytext = "\\longleftarrow";         return 'SYMBOL'; %}
"<=>"           %{ yytext = "\\Leftrightarrow";        return 'SYMBOL'; %}
"<==>"          %{ yytext = "\\Longleftrightarrow";    return 'SYMBOL'; %}
"=>"            %{ yytext = "\\Rightarrow";            return 'SYMBOL'; %}
"==>"           %{ yytext = "\\Longrightarrow";        return 'SYMBOL'; %}
"<=="           %{ yytext = "\\Longleftarrow";         return 'SYMBOL'; %}
"|->"           %{ yytext = "\\mapsto";                return 'SYMBOL'; %}


"..."           %{ yytext = "\\ldots";                 return 'OTHER'; %}
(("I"|"i")"nf"("ini")?"ty")   %{ yytext = "\\infty";   return 'OTHER'; %}




("der")         |
("part"("ial")?)	{ yylval = (int)"\\partial"; return SOTH; }
("grad")        |
("nabla")       { yylval = (int)"\\nabla"; return SOTH; }

(("for"(" ")?)?"all")   { yylval = (int)"\\forall"; return SSET; }
("exists")      { yylval = (int)"\\exists"; return SSET; }

("in")          { yylval = (int)"\\in"; return SSET; }
("not"(" ")?"in")       { yylval = (int)"\\notin"; return SSET; }
("subset")      { yylval = (int)"\\subseteq"; return SSET; }
("sup"("er")?"set")     { yylval = (int)"\\supseteq"; return SSET; }

("union")       |
("cup")         { yylval = (int)"\\cup"; return SSET; }
("intersect"("ion")?)   |
("cap")         { yylval = (int)"\\cap"; return SSET; }
"\\"            { yylval = (int)"\\setminus"; return SSET; }












\s+                   /* skip whitespace */
<<EOF>>               return 'EOF'
.                     return 'INVALID'

/lex

/* =============================================================== */

%% /* language grammar */

exp: sent EOF     { return $1; }
;

sent: e
| sent e          { $$ = $1 + $2; }
;
e: SYMBOL         { $$ = yytext; }
| OTHER           { $$ = yytext; /* debug only */ }
;

