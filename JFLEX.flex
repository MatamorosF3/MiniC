package minic;
import java_cup.runtime.Symbol;


%%


%cup
%full
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
        "main"          {System.out.println("main: " + yytext()); return new Symbol(sym.MAIN, yychar, yyline, yytext());}
        "if"            {System.out.println("Open if: " + yytext()); return new Symbol(sym.IF,yychar,yyline,yytext());}
        "else"          {System.out.println("else del if: " + yytext()); return new Symbol(sym.ELSE,yychar,yyline,yytext());}        
        "for"           {System.out.println("Open for: " + yytext()); return new Symbol(sym.FOR,yychar,yyline,yytext());}        
        "while"         {System.out.println("Open while: " + yytext()); return new Symbol(sym.WHILE,yychar,yyline,yytext());}    
        "break"         {System.out.println("Open while: " + yytext()); return new Symbol(sym.BREAK,yychar,yyline,yytext());}    
        "return"        {System.out.println("return: " + yytext()); return new Symbol(sym.RETURN,yychar,yyline,yytext());}        
        "void"          {System.out.println("void " + yytext()); return new Symbol(sym.VOID,yychar,yyline,yytext());}
        "int"           {System.out.println("Type: " + yytext()); return new Symbol(sym.INT,yychar,yyline,yytext());}
        "char"          {System.out.println("Type: " + yytext()); return new Symbol(sym.CHAR,yychar,yyline,yytext());}
        "string"        {System.out.println("Type: " + yytext()); return new Symbol(sym.STRING,yychar,yyline,yytext());} 
        "scanf"         {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.SCANF,yychar,yyline,yytext());}
        "printf"        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.PRINTF,yychar,yyline,yytext());}
        "\"%d"\"        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.DFLAG,yychar,yyline,yytext());}
        "\"%s\""        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.SFLAG,yychar,yyline,yytext());}
        "\"%c\""        {System.out.println("Scaneo: " + yytext()); return new Symbol(sym.CFLAG,yychar,yyline,yytext());}         

        /*Arithmetic Operators*/
        "+"             {System.out.println("Plus: " + yytext()); return new Symbol(sym.PLUS,yychar,yyline,yytext());}        
        "++"            {System.out.println("PlusPlus: " + yytext()); return new Symbol(sym.PLUSPLUS,yychar,yyline,yytext());}        
        "-"             {System.out.println("Minus: " + yytext()); return new Symbol(sym.MINUS,yychar,yyline,yytext());}
        "--"            {System.out.println("MinusMinus: " + yytext()); return new Symbol(sym.MINUSMINUS,yychar,yyline,yytext());}
        "*"             {System.out.println("Mult: " + yytext()); return new Symbol(sym.MULT,yychar,yyline,yytext());}
        "/"             {System.out.println("Div: " + yytext()); return new Symbol(sym.DIV,yychar,yyline,yytext());}

        /*Relational Operators*/                
        "!="            {System.out.println("Not Equal: " + yytext()); return new Symbol(sym.NOTEQ,yychar,yyline,yytext());}
        "=="            {System.out.println("Equal to: " + yytext()); return new Symbol(sym.EQEQ,yychar,yyline,yytext());}
        ">"             {System.out.println("Greater than: " + yytext()); return new Symbol(sym.GT,yychar,yyline,yytext());}
        "<"             {System.out.println("Less than: " + yytext()); return new Symbol(sym.LT,yychar,yyline,yytext());}
        ">="            {System.out.println("Greater than or Equal: " + yytext()); return new Symbol(sym.GTEQ,yychar,yyline,yytext());}
        "<="            {System.out.println("Less than or Equal: " + yytext()); return new Symbol(sym.LTEQ,yychar,yyline,yytext());}
         
        /*Logical Operators*/
        "||"            {System.out.println("OrOr: " + yytext()); return new Symbol(sym.OROR,yychar,yyline,yytext());}
        "&&"            {System.out.println("AndAnd: " + yytext()); return new Symbol(sym.ANDAND,yychar,yyline,yytext());}
        "!"             {System.out.println("Not: " + yytext()); return new Symbol(sym.NOT,yychar,yyline,yytext());}
        "|"             {System.out.println("Or " + yytext()); return new Symbol(sym.OR,yychar,yyline,yytext());}
        "&"             {System.out.println("And" + yytext()); return new Symbol(sym.AND,yychar,yyline,yytext());}    

        /*Assignment Operators*/
        "="             {System.out.println("Asignar: " + yytext()); return new Symbol(sym.EQ,yychar,yyline,yytext());}
        "+="            {System.out.println("AddAsign: " + yytext()); return new Symbol(sym.PLUSEQ,yychar,yyline,yytext());}
        "-="            {System.out.println("SubAsign: " + yytext()); return new Symbol(sym.MINUSEQ,yychar,yyline,yytext());}
        "*="            {System.out.println("MultAsign: " + yytext()); return new Symbol(sym.MULTEQ,yychar,yyline,yytext());}
        "/="            {System.out.println("DivAsign: " + yytext()); return new Symbol(sym.DIVEQ,yychar,yyline,yytext());}
        
        ";"             {System.out.println("Semicolon" + yytext());return new Symbol(sym.SEMICOLON,yychar,yyline,yytext());}
        ","             {System.out.println("Comma: " + yytext()); return new Symbol(sym.COMMA,yychar,yyline,yytext());}                 
        "{"             {System.out.println("LBrace: " + yytext());return new Symbol(sym.LBRACE,yychar,yyline,yytext());}
        "}"             {System.out.println("RBrace: " + yytext()); return new Symbol(sym.RBRACE,yychar,yyline,yytext());}
        "("             {System.out.println("LParen: " + yytext()); return new Symbol(sym.LPAREN,yychar,yyline,yytext());}
        ")"             {System.out.println("RParen: " + yytext());return new Symbol(sym.RPAREN,yychar,yyline,yytext());}
        "["             {System.out.println("LBrack: " + yytext()); return new Symbol(sym.LBRACK,yychar,yyline,yytext());}
        "]"             {System.out.println("RBrack: " + yytext()); return new Symbol(sym.RBRACK,yychar,yyline,yytext());}
        

     


}
        {conststr}      {System.out.println("String: " + yytext()); return new Symbol(sym.CONSTSTR,yychar,yyline,yytext());}
        {Comment}       { /*ignore*/}
        {emptySpace}    { /*ignore*/}
        {Integer}       {System.out.println("Integer: " + yytext());return new Symbol(sym.INTEGER,yychar,yyline,yytext()); }        
        {constchar}     {System.out.println("Char: " + yytext()); return new Symbol(sym.CONSTCHAR,yychar,yyline,yytext());}  
        {Identifier}    {System.out.println("Identifier: "  + yytext()); return new Symbol(sym.IDENTIFIER,yychar,yyline,yytext());}
        .               {System.out.println("Unexpected token: \'"+yytext()+"\' at: "+yyline);}