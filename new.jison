/* description: Parses EzMath to LaTeX. */

/* lexical grammar */
%lex
%%

"(ast)"         %{ yytext = "\\circleast";  return 'SYMBOL'; %}

"<==>"          %{ yytext = "\\Longleftrightarrow";    return 'SYMBOL'; %}
"<-->"          %{ yytext = "\\longleftrightarrow";    return 'SYMBOL'; %}

"(+)"           %{ yytext = "\\oplus";      return 'SYMBOL'; %}
"(-)"           %{ yytext = "\\ominus";     return 'SYMBOL'; %}
"(*)"           %{ yytext = "\\otimes";     return 'SYMBOL'; %}
"(.)"           %{ yytext = "\\odot";       return 'SYMBOL'; %}
"(/)"           %{ yytext = "\\oslash";     return 'SYMBOL'; %}

"<=>"           %{ yytext = "\\Leftrightarrow";        return 'SYMBOL'; %}
"==>"           %{ yytext = "\\Longrightarrow";        return 'SYMBOL'; %}
"<=="           %{ yytext = "\\Longleftarrow";         return 'SYMBOL'; %}
"<->"           %{ yytext = "\\leftrightarrow";        return 'SYMBOL'; %}
"-->"           %{ yytext = "\\longrightarrow";        return 'SYMBOL'; %}
"<--"           %{ yytext = "\\longleftarrow";         return 'SYMBOL'; %}
"|->"           %{ yytext = "\\mapsto";                return 'SYMBOL'; %}

"..."           %{ yytext = "\\ldots";      return 'SYMBOL'; %}

"~="            %{ yytext = "\\cong";       return 'SYMBOL'; %}
"~~"            %{ yytext = "\\approx";     return 'SYMBOL'; %}
"=="            %{ yytext = "\\equiv";      return 'SYMBOL'; %}
"!="            %{ yytext = "\\neq";        return 'SYMBOL'; %}

"=>"            %{ yytext = "\\Rightarrow";            return 'SYMBOL'; %}
"->"            %{ yytext = "\\rightarrow";            return 'SYMBOL'; %}
"<-"            %{ yytext = "\\leftarrow";             return 'SYMBOL'; %}

"<<"            %{ yytext = "\\ll";         return 'SYMBOL'; %}
">>"            %{ yytext = "\\gg";         return 'SYMBOL'; %}
"<="            %{ yytext = "\\leq";        return 'SYMBOL'; %}
">="            %{ yytext = "\\geq";        return 'SYMBOL'; %}
"-<"            %{ yytext = "\\prec";       return 'SYMBOL'; %}
">-"            %{ yytext = "\\succ";       return 'SYMBOL'; %}

"//"            %{ yytext = "\\div";        return 'SYMBOL'; %}
"||"            %{ yytext = "\\|";          return 'SYMBOL'; %}
"\\"            %{ yytext = "\\setminus";   return 'SYMBOL'; %}

"+-"            %{ yytext = "\\pm";         return 'SYMBOL'; %}
"-+"            %{ yytext = "\\mp";         return 'SYMBOL'; %}

"+"             %{ yytext = "+";            return 'SYMBOL'; %}
"-"             %{ yytext = "-";            return 'SYMBOL'; %}
"*"             %{ yytext = "\\times";      return 'SYMBOL'; %}
"."             %{ yytext = "\\cdot";       return 'SYMBOL'; %}

"="             %{ yytext = "=";            return 'SYMBOL'; %}
"<"             %{ yytext = "\\lt";         return 'SYMBOL'; %}
">"             %{ yytext = "\\gt";         return 'SYMBOL'; %}

"~"             %{ yytext = "\\sim";        return 'SYMBOL'; %}
"|"             %{ yytext = "|";            return 'SYMBOL'; %}


("ast")         %{ yytext = "*";            return 'SYMBOL'; %}
("deg"("ree")?) %{ yytext = "{^\\circ}";    return 'SYMBOL'; %}
("star")        %{ yytext = "\\star";       return 'SYMBOL'; %}
("der")         %{ yytext = "\\partial";    return 'SYMBOL'; %}
("nabla")       %{ yytext = "\\nabla";      return 'SYMBOL'; %}

"propto"        %{ yytext = "\\propto";     return 'SYMBOL'; %}
"infinity"      %{ yytext = "\\infty";      return 'SYMBOL'; %}

"exists"        %{ yytext = "\\exists";     return 'SYMBOL'; %}
"all"           %{ yytext = "\\forall";     return 'SYMBOL'; %}

"superset"      %{ yytext = "\\supseteq";   return 'SYMBOL'; %}
"supset"        %{ yytext = "\\supseteq";   return 'SYMBOL'; %}
"subset"        %{ yytext = "\\subseteq";   return 'SYMBOL'; %}
"not in"        %{ yytext = "\\notin";      return 'SYMBOL'; %}
"in"            %{ yytext = "\\in";         return 'SYMBOL'; %}

"intersection"  %{ yytext = "\\cap";        return 'SYMBOL'; %}
"intersect"     %{ yytext = "\\cap";        return 'SYMBOL'; %}
"union"         %{ yytext = "\\cup";        return 'SYMBOL'; %}

"and"           %{ yytext = "\\land";       return 'SYMBOL'; %}
"or"            %{ yytext = "\\lor";        return 'SYMBOL'; %}
"not"           %{ yytext = "\\neg";        return 'SYMBOL'; %}

"aleph"         %{ yytext = "\\aleph";      return 'SYMBOL'; %}
"Aleph"         %{ yytext = "\\aleph";      return 'SYMBOL'; %}
"empty"         %{ yytext = "\\emptyset";   return 'SYMBOL'; %}
"Eset"          %{ yytext = "\\varnothing"; return 'SYMBOL'; %}
"Nset"          %{ yytext = "\\mathbb{N}";  return 'SYMBOL'; %}
"Zset"          %{ yytext = "\\mathbb{Z}";  return 'SYMBOL'; %}
"Pset"          %{ yytext = "\\mathbb{P}";  return 'SYMBOL'; %}
"Qset"          %{ yytext = "\\mathbb{Q}";  return 'SYMBOL'; %}
"Rset"          %{ yytext = "\\mathbb{R}";  return 'SYMBOL'; %}
"Cset"          %{ yytext = "\\mathbb{C}";  return 'SYMBOL'; %}
"Hset"          %{ yytext = "\\mathbb{H}";  return 'SYMBOL'; %}
"Re"            %{ yytext = "\\Re";         return 'SYMBOL'; %}
"Im"            %{ yytext = "\\Im";         return 'SYMBOL'; %}

"exp"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"log"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"ln"            %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"max"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"min"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"inf"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"sup"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

"gcd"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"det"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
"mod"           %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

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




("hbar")        %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("imath")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("jmath")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("ell")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

("alpha")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("beta")        %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Gamma")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("gamma")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Delta")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("delta")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("epsilon")     %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("varepsilon")  %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("zeta")        %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("eta")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Theta")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("vartheta")    %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("theta")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("iota")        %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("kappa")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Lambda")      %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("lambda")      %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("mu")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("nu")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Xi")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("xi")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("omicron")     %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Pi")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("varpi")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("pi")          %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("varrho")      %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("rho")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Sigma")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("varsigma")    %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("sigma")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("tau")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Upsilon")     %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("upsilon")     %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Phi")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("varphi")      %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("phi")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("chi")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Psi")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("psi")         %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("Omega")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
("omega")       %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}

[0-9]+"."[0-9]*"..."[0-9]+"..."          %{ return 'REPEAT'; %}
[0-9]+("."[0-9]+("...")?)?	         %{ return 'SYMBOL'; %}

\@\"[^\"]*\"    %{ yytext = yytext.slice(2,-1);               return 'SYMBOL'; %}
\"\"            %{ yytext = "{}";           return 'SYMBOL'; %}
\"[^\"]*\"      %{ yytext = "\\text{"+yytext.slice(1,-1)+"}"; return 'SYMBOL'; %}

[a-zA-Z]        %{ yytext = " "+yytext;     return 'SYMBOL'; %}
[%&]            %{ yytext = "\\"+yytext;    return 'SYMBOL'; %}
[`':!@\?\$]                              %{ return 'SYMBOL'; %}








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
| REPEAT          { var i = $$.length-1; while($$.charAt(i)==".") i--;
                    var j = i-1;         while($$.charAt(j)!=".") j--;
                    $$ = $$.slice(0,j-2)+"\\overline{"+$$.slice(j+1,i+1)+"}"; }
| OPNAME          { $$ = "\\operatorname{"+yytext+"}"; }
;

