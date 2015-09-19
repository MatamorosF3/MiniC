package minic;
import java_cup.runtime.Symbol;


%%


%cup
%full
%column
%line
%char
%ignorecase
%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}
InputCharacter = [^\r\n]
Comment = {TraditionalComment}|{EndOfLineComment}
TraditionalComment = "/*" [^*]+ "*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}*  
LineTerminator = \r|\n|\r\n
Integer= [0-9][0-9]*
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
conststr = \"[a-zA-z_\-\d\s\r\n\t]*\"
constchar = \'[a-zA-Z0-9]\'
emptySpace = [\n\r\t ]


%%
<YYINITIAL>{
	/*keywords*/
        "main"          {System.out.println("main: " + yytext()); return new Symbol(sym.MAIN, yycolumn, yyline, yytext());}
        "if"            {System.out.println("Open if: " + yytext()); return new Symbol(sym.IF,yycolumn,yyline,yytext());}
        "else"          {System.out.println("else del if: " + yytext()); return new Symbol(sym.ELSE,yycolumn,yyline,yytext());}        
        "for"           {System.out.println("Open for: " + yytext()); return new Symbol(sym.FOR,yycolumn,yyline,yytext());}        
        "while"         {System.out.println("Open while: " + yytext()); return new Symbol(sym.WHILE,yycolumn,yyline,yytext());}    
        "break"         {System.out.println("Open while: " + yytext()); return new Symbol(sym.BREAK,yycolumn,yyline,yytext());}    
        "return"        {System.out.println("return: " + yytext()); return new Symbol(sym.RETURN,yycolumn,yyline,yytext());}        
        "void"          {System.out.println("void " + yytext()); return new Symbol(sym.VOID,yycolumn,yyline,yytext());}
        "int"           {System.out.println("Type: " + yytext()); return new Symbol(sym.INT,yycolumn,yyline,yytext());}
        "char"          {System.out.println("Type: " + yytext()); return new Symbol(sym.CHAR,yycolumn,yyline,yytext());}
        "string"        {System.out.println("Type: " + yytext()); return new Symbol(sym.STRING,yycolumn,yyline,yytext());} 
        "scanf"         {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.SCANF,yycolumn,yyline,yytext());}
        "printf"        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.PRINTF,yycolumn,yyline,yytext());}
        "\"%d"\"        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.DFLAG,yycolumn,yyline,yytext());}
        "\"%s\""        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.SFLAG,yycolumn,yyline,yytext());}
        "\"%c\""        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.CFLAG,yycolumn,yyline,yytext());}         

        /*Arithmetic Operators*/
        "+"             {System.out.println("Plus: " + yytext()); return new Symbol(sym.PLUS,yycolumn,yyline,yytext());}        
        "++"            {System.out.println("PlusPlus: " + yytext()); return new Symbol(sym.PLUSPLUS,yycolumn,yyline,yytext());}        
        "-"             {System.out.println("Minus: " + yytext()); return new Symbol(sym.MINUS,yycolumn,yyline,yytext());}
        "--"            {System.out.println("MinusMinus: " + yytext()); return new Symbol(sym.MINUSMINUS,yycolumn,yyline,yytext());}
        "*"             {System.out.println("Mult: " + yytext()); return new Symbol(sym.MULT,yycolumn,yyline,yytext());}
        "/"             {System.out.println("Div: " + yytext()); return new Symbol(sym.DIV,yycolumn,yyline,yytext());}

        /*Relational Operators*/                
        "!="            {System.out.println("Not Equal: " + yytext()); return new Symbol(sym.NOTEQ,yycolumn,yyline,yytext());}
        "=="            {System.out.println("Equal to: " + yytext()); return new Symbol(sym.EQEQ,yycolumn,yyline,yytext());}
        ">"             {System.out.println("Greater than: " + yytext()); return new Symbol(sym.GT,yycolumn,yyline,yytext());}
        "<"             {System.out.println("Less than: " + yytext()); return new Symbol(sym.LT,yycolumn,yyline,yytext());}
        ">="            {System.out.println("Greater than or Equal: " + yytext()); return new Symbol(sym.GTEQ,yycolumn,yyline,yytext());}
        "<="            {System.out.println("Less than or Equal: " + yytext()); return new Symbol(sym.LTEQ,yycolumn,yyline,yytext());}
         
        /*Logical Operators*/
        "||"            {System.out.println("OrOr: " + yytext()); return new Symbol(sym.OROR,yycolumn,yyline,yytext());}
        "&&"            {System.out.println("AndAnd: " + yytext()); return new Symbol(sym.ANDAND,yycolumn,yyline,yytext());}
        "!"             {System.out.println("Not: " + yytext()); return new Symbol(sym.NOT,yycolumn,yyline,yytext());}
        "|"             {System.out.println("Or " + yytext()); return new Symbol(sym.OR,yycolumn,yyline,yytext());}
        "&"             {System.out.println("And" + yytext()); return new Symbol(sym.AND,yycolumn,yyline,yytext());}    

        /*Assignment Operators*/
        "="             {System.out.println("Asignar: " + yytext()); return new Symbol(sym.EQ,yycolumn,yyline,yytext());}
        "+="            {System.out.println("AddAsign: " + yytext()); return new Symbol(sym.PLUSEQ,yycolumn,yyline,yytext());}
        "-="            {System.out.println("SubAsign: " + yytext()); return new Symbol(sym.MINUSEQ,yycolumn,yyline,yytext());}
        "*="            {System.out.println("MultAsign: " + yytext()); return new Symbol(sym.MULTEQ,yycolumn,yyline,yytext());}
        "/="            {System.out.println("DivAsign: " + yytext()); return new Symbol(sym.DIVEQ,yycolumn,yyline,yytext());}
        
        ";"             {System.out.println("Semicolon" + yytext());return new Symbol(sym.SEMICOLON,yycolumn,yyline,yytext());}
        ","             {System.out.println("Comma: " + yytext()); return new Symbol(sym.COMMA,yycolumn,yyline,yytext());}                 
        "{"             {System.out.println("LBrace: " + yytext());return new Symbol(sym.LBRACE,yycolumn,yyline,yytext());}
        "}"             {System.out.println("RBrace: " + yytext()); return new Symbol(sym.RBRACE,yycolumn,yyline,yytext());}
        "("             {System.out.println("LParen: " + yytext()); return new Symbol(sym.LPAREN,yycolumn,yyline,yytext());}
        ")"             {System.out.println("RParen: " + yytext());return new Symbol(sym.RPAREN,yycolumn,yyline,yytext());}
        "["             {System.out.println("LBrack: " + yytext()); return new Symbol(sym.LBRACK,yycolumn,yyline,yytext());}
        "]"             {System.out.println("RBrack: " + yytext()); return new Symbol(sym.RBRACK,yycolumn,yyline,yytext());}
        

     


}
        {conststr}      {System.out.println("String: " + yytext()); return new Symbol(sym.CONSTSTR,yycolumn,yyline,yytext());}
        {Comment}       { /*ignore*/}
        {emptySpace}    { /*ignore*/}
        {Integer}       {System.out.println("Integer: " + yytext());return new Symbol(sym.INTEGER,yycolumn,yyline,yytext()); }        
        {constchar}     {System.out.println("Char: " + yytext()); return new Symbol(sym.CONSTCHAR,yycolumn,yyline,yytext());}  
        {Identifier}    {System.out.println("Identifier: "  + yytext()); return new Symbol(sym.IDENTIFIER,yycolumn,yyline,yytext());}
        .               {System.out.println("Unexpected token: \'"+yytext()+"\' at: "+yyline);}