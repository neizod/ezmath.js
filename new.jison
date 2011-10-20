/* description: Parses EzMath to LaTeX. */

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
"star"          %{ yytext = "\\star";       return 'SYMBOL'; %}

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
"|->"           %{ /* bug */ yytext = "\\mapsto";                return 'SYMBOL'; %}


"..."           %{ yytext = "\\ldots";      return 'SYMBOL'; %}
"infinity"      %{ yytext = "\\infty";      return 'SYMBOL'; %}


("der")         %{ yytext = "\\partial";    return 'SYMBOL'; %}
"nabla"         %{ yytext = "\\nabla";      return 'SYMBOL'; %}

"all"           %{ yytext = "\\forall";     return 'SYMBOL'; %}
"exists"        %{ yytext = "\\exists";     return 'SYMBOL'; %}

"in"            %{ yytext = "\\in";         return 'SYMBOL'; %}
"not in"        %{ yytext = "\\notin";      return 'SYMBOL'; %}
"subset"        %{ yytext = "\\subseteq";   return 'SYMBOL'; %}
"supset"        %{ yytext = "\\supseteq";   return 'SYMBOL'; %}
"superset"      %{ yytext = "\\supseteq";   return 'SYMBOL'; %}

"union"         %{ yytext = "\\cup";        return 'SYMBOL'; %}
"intersect"     %{ yytext = "\\cap";        return 'SYMBOL'; %}
"intersection"  %{ yytext = "\\cap";        return 'SYMBOL'; %}
"\\"            %{ yytext = "\\setminus";   return 'SYMBOL'; %}




"empty"         %{ yytext = "\\emptyset";   return 'SYMBOL'; %}
"Eset"          %{ yytext = "\\varnothing"; return 'SYMBOL'; %}
"Nset"          %{ yytext = "\\mathbb{N}";  return 'SYMBOL'; %}
"Zset"          %{ yytext = "\\mathbb{Z}";  return 'SYMBOL'; %}
"Pset"          %{ yytext = "\\mathbb{P}";  return 'SYMBOL'; %}
"Qset"          %{ yytext = "\\mathbb{Q}";  return 'SYMBOL'; %}
"Rset"          %{ yytext = "\\mathbb{R}";  return 'SYMBOL'; %}
"Cset"          %{ yytext = "\\mathbb{C}";  return 'SYMBOL'; %}
"Hset"          %{ yytext = "\\mathbb{H}";  return 'SYMBOL'; %}
"aleph"         %{ yytext = "\\aleph";      return 'SYMBOL'; %}
"Aleph"         %{ yytext = "\\aleph";      return 'SYMBOL'; %}
"Re"            %{ yytext = "\\Re";         return 'SYMBOL'; %}
"Im"            %{ yytext = "\\Im";         return 'SYMBOL'; %}

"exp"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"log"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"ln"            %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"max"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"min"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"gcd"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"det"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"mod"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"inf"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"sup"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"sin"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"cos"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"tan"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"cot"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"sec"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"csc"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"sinh"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"cosh"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"tanh"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"coth"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"sech"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"csch"          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"asin"          %{ yytext = "\\sin^{-1}";   return 'SYMBOL'; %}
"acos"          %{ yytext = "\\cos^{-1}";   return 'SYMBOL'; %}
"atan"          %{ yytext = "\\tan^{-1}";   return 'SYMBOL'; %}
"acot"          %{ yytext = "\\cot^{-1}";   return 'SYMBOL'; %}
"asec"          %{ yytext = "\\sec^{-1}";   return 'SYMBOL'; %}
"acsc"          %{ yytext = "\\csc^{-1}";   return 'SYMBOL'; %}
"asinh"         %{ yytext = "\\sinh^{-1}";  return 'SYMBOL'; %}
"acosh"         %{ yytext = "\\cosh^{-1}";  return 'SYMBOL'; %}
"atanh"         %{ yytext = "\\tanh^{-1}";  return 'SYMBOL'; %}
"acoth"         %{ yytext = "\\coth^{-1}";  return 'SYMBOL'; %}
"asech"         %{ yytext = "\\sech^{-1}";  return 'SYMBOL'; %}
"acsch"         %{ yytext = "\\csch^{-1}";  return 'SYMBOL'; %}

"lcm"           %{ return 'OPNAME'; %}
"sgn"           %{ return 'OPNAME'; %}
"rad"           %{ return 'OPNAME'; %}
"case"          %{ return 'OPNAME'; %}


















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
| OPNAME          { $$ = "\\operatorname{"+yytext+"}" }
;

