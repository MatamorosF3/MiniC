/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minic;
import java.io.*;


/**
 *
 * @author fjmc_
 */
public class MiniC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        // TODO code application logic here
        jflex.Main.generate( new File("lexico.flex") );
        lexico2 lex = new lexico2( new FileReader("test.txt") );
        
        
         while (lex.yylex() != lexico2.YYEOF);
        
//       
}
}
