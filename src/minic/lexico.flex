package minic;


%%

%class lexico2

%standalone
%unicode
%line
%char
%column

InputCharacter = [^\r\n]




Comment = {TraditionalComment}|{LineComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
LineComment = "//" {InputCharacter}* {LineTerminator}?
LineTerminator = \r|\n|\r\n


Integer= [0-9]
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
conststr = \"[a-zA-z_\-\d\s\r\n\t]*\"
constchar = \'[a-zA-Z0-9]\'
emptySpace = [\n\r\t ]


%%
<YYINITIAL>{
	/*keywords*/
        "if"            {System.out.println("Open if: " + yytext());}
        "else"          {System.out.println("else del if: " + yytext());}        
        "for"           {System.out.println("Open for: " + yytext());}        
        "while"         {System.out.println("Open while: " + yytext());}        
        "private"       {System.out.println("private" + yytext());}
        "public"        {System.out.println("public: " + yytext());}
        "return"        {System.out.println("return: " + yytext());}
        "new"           {System.out.println("new: " + yytext());}
        "void"          {System.out.println("void " + yytext());}
        "int"           {System.out.println("Type: " + yytext());}
        "char"          {System.out.println("Type: " + yytext());}
        "string"        {System.out.println("Type: " + yytext());} 
        "scanf"         {System.out.println("Scaneo: " + yytext());}
        "printf"        {System.out.println("Scaneo: " + yytext());}
        "\"%d\""        {System.out.println("Scaneo: " + yytext());}
        "\"%s\""        {System.out.println("Scaneo: " + yytext());}
        "\"%c\""        {System.out.println("Scaneo: " + yytext());}         

        /*Arithmetic Operators*/
        "+"             {System.out.println("Plus: " + yytext());}        
        "++"            {System.out.println("PlusPlus: " + yytext());}        
        "-"             {System.out.println("Minus: " + yytext());}
        "--"            {System.out.println("MinusMinus: " + yytext());}
        "*"             {System.out.println("Mult: " + yytext());}
        "/"             {System.out.println("Div: " + yytext());}

        /*Relational Operators*/                
        "!="            {System.out.println("Not Equal: " + yytext());}
        "=="            {System.out.println("Equal to: " + yytext());}
        ">"             {System.out.println("Greater than: " + yytext());}
        "<"             {System.out.println("Less than: " + yytext());}
        ">="            {System.out.println("Greater than or Equal: " + yytext());}
        "<="            {System.out.println("Less than or Equal: " + yytext());}
         
        /*Logical Operators*/
        "||"            {System.out.println("OrOr: " + yytext());}
        "&&"            {System.out.println("AndAnd: " + yytext());}
        "!"             {System.out.println("Not: " + yytext());}
        "|"             {System.out.println("Or " + yytext());}
        "&"             {System.out.println("And" + yytext());}    

        /*Assignment Operators*/
        "="             {System.out.println("Asignar: " + yytext());}
        "+="            {System.out.println("AddAsign: " + yytext());}
        "-="            {System.out.println("SubAsign: " + yytext());}
        "*="            {System.out.println("MultAsign: " + yytext());}
        "/="            {System.out.println("DivAsign: " + yytext());}
        
        ";"             {System.out.println("Semicolon" + yytext());}
        ","             {System.out.println("Comma: " + yytext());}                 
        "{"             {System.out.println("LBrace: " + yytext());}
        "}"             {System.out.println("RBrace: " + yytext());}
        "("             {System.out.println("LParen: " + yytext());}
        ")"             {System.out.println("RParen: " + yytext());}
        "["             {System.out.println("LBrack: " + yytext());}
        "]"             {System.out.println("RBrack: " + yytext());}


        {conststr}      {System.out.println("String: " + yytext());}
        {Comment}       { /*ignore*/}
        {emptySpace}    { /*ignore*/}
        {Integer}       {System.out.println("Integer: " + yytext());}        
        {constchar}     {System.out.println("Char: " + yytext());}  
        {Identifier}    {System.out.println("Identifier: "  + yytext());}
        .               {System.out.println("Unexpected token: \'"+yytext()+"\' at: "+(yyline+1)+ " column:" + (yycolumn+1));}
}
