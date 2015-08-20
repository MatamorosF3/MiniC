/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minic;
import java.io.*;
import java.util.Scanner;
import jflex.SilentExit;


/**
 *
 * @author fjmc_
 */
public class MiniC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException, SilentExit {
        // TODO code application logic here
        File m = new File("./src/minic/lexico2.java");
        File m2 = new File("./src/minic/lexico2.java~");
        File m3 = new File("./build/classes/minic");
        
        if(m.exists()){
            m.delete();
            System.out.println("Borrando el Archivo");
        }
        if(m2.exists()){
            m2.delete();
            System.out.println("Borrando el Archivo");
        }
        if(m3.exists()){
            m3.delete();
            System.out.println("Borrando el Archivo");
        }
         
        File f = new File("./src/minic/lexico.flex");
        
        
        jflex.Main.generate(f);
        
        
        lexico2 lex = new lexico2( new FileReader("test.txt") );
        
         while (lex.yylex() != lexico2.YYEOF);
        
//       
}
}
