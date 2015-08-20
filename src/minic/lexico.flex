package minic;


%%

%class lexico2

%standalone
%line
%char

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

Integer=[0-9]*
ShortComment = [\/][\/][\w ]*
Letter=[a-zA-Z]
Array = variable[]
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
conststr = \"[a-zA-z_\-\d\s\r\n\t]*\"


%%
<YYINITIAL>{
	{conststr}             {System.out.println("String: " + yytext());}
        {Integer} 			 {System.out.println("Integer: " + yytext());}
        {TraditionalComment} {System.out.println("Comments" + yytext());}
        {Identifier}            {System.out.println("Identifier"  + yytext());}
        
}

