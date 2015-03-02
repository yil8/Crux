package crux;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;

public class Compiler {
    public static String studentName = "TODO: Your Name";
    public static String studentID = "TODO: Your 8-digit id";
    public static String uciNetID = "TODO: uci-net id";
    
    public static boolean release = false;
    
    public static void main(String[] args)
    {
//    	if (release) {
//    		releasedMain(args[0]);
//    	} else {
//	        for (int i=1; i<=11; ++i) {
//	        	String sourceFilename = String.format("tests/private/testP%02d.crx", i);
//	        	fileCompile(sourceFilename);
//	        }
//    	}
    	
    	fileCompile(args[0]);
    }
    
    public static void releasedMain(String sourceFilename)
    {
        Scanner s = null;
        try {
            s = new Scanner(new FileReader(sourceFilename));
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error accessing the source file: \"" + sourceFilename + "\"");
            System.exit(-2);
        }

        Parser p = new Parser(s);
        p.parse();
        if (p.hasError()) {
            System.out.println("Error parsing file.");
            System.out.println(p.errorReport());
            System.exit(-3);
        }
        System.out.println("Crux program successfully parsed.");

    }
        
    public static void fileCompile(String sourceFilename)
    {
//    	System.out.println("outputing for " + sourceFilename);
        
        Scanner s = null;
        try {
            s = new Scanner(new FileReader(sourceFilename));
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error accessing the source file: \"" + sourceFilename + "\"");
            System.exit(-2);
        }

        Parser p = new Parser(s);
        ast.Command syntaxTree = p.parse();
        p.parse();
        if (p.hasError()) {
            System.out.println("Error parsing file " + sourceFilename);
            System.out.println(p.errorReport());
            System.exit(-3);
        }
        System.out.println("Crux program successfully parsed.");

        ast.PrettyPrinter pp = new ast.PrettyPrinter();
        syntaxTree.accept(pp);
        System.out.println(pp.toString());

    }
}
    
