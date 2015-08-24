package minic;


%%

%class lexico2

%standalone
%unicode
%line
%char
%column

/* main character classes */
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | 
          {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/*" "*"+ [^/*] ~"*/"

Integer=[0-9][0-9]*
ShortComment = [\/][\/][\w ]*
Letter=[a-zA-Z]
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
Array = Identifier[]
conststr = \"[a-zA-z_\-\d\s\r\n\t]*\"
constchar = \'[a-zA-Z0-9]\'
emptySpace = [\n\r\t]+


%%
<YYINITIAL>{
	    {conststr}              {System.out.println("String: " + yytext());}
        {Integer} 			    {System.out.println("Integer: " + yytext());}
        {Comment}               {System.out.println("Comment: " + yytext());}
        {Identifier}            {System.out.println("Identifier: "  + yytext());}
        {constchar}             {System.out.println("Char: " + yytext());}  
        {WhiteSpace}            {System.out.println("Espacio Vacio: " + yytext());}
        {Integer}\               {System.out.println("Numero: " + yytext());} 
        
        "int"\                   {System.out.println("Type: " + yytext());}
        "char"                  {System.out.println("Type: " + yytext());}
        "string"                {System.out.println("Type: " + yytext());} 

        "scanf"                 {System.out.println("Scaneo: " + yytext());}
        "print"                 {System.out.println("Scaneo: " + yytext());}
        "\"%d"\"                {System.out.println("Scaneo: " + yytext());}
        "\"%s\""                   {System.out.println("Scaneo: " + yytext());}
        "\"%f\""                    {System.out.println("Scaneo: " + yytext());}         

        "+"                     {System.out.println("Mas: " + yytext());}        
        "-"                     {System.out.println("Menos: " + yytext());}
        "*"                     {System.out.println("Multiplicacion: " + yytext());}
        "/"                     {System.out.println("Igual: " + yytext());}
        "="                     {System.out.println("Asignar: " + yytext());}

        "!="                    {System.out.println("Not Equal: " + yytext());}
        "=="                    {System.out.println("Equal to: " + yytext());}
        ">"                     {System.out.println("Greater than: " + yytext());}
        "<"                     {System.out.println("Less than: " + yytext());}
        ">="                    {System.out.println("Greater than or Equal: " + yytext());}
        "<="                    {System.out.println("Less than or Equal: " + yytext());}

        "main"\                  {System.out.println("Main: " + yytext());}
        ";"                     {System.out.println("Instruccion" + yytext());}
        ","                     {System.out.println("Coma: " + yytext());}        

        "{"                     {System.out.println("Tu lo abres: " + yytext());}
        "}"                     {System.out.println("Tu lo cierras: " + yytext());}
        "("                     {System.out.println("Tu lo abres: " + yytext());}
        ")"                     {System.out.println("Tu lo cierras: " + yytext());}

        "if"\                    {System.out.println("Open if: " + yytext());}
        "else"\                 {System.out.println("else del if: " + yytext());}
        
        "for"\                   {System.out.println("Open for: " + yytext());}
        
        "while"\                 {System.out.println("Open while: " + yytext());}

        .                       {System.out.println("Unexpected token: \'"+yytext()+"\' at line: "+yyline);}
}

