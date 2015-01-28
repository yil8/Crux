package crux;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilePermission;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.ArrayList;

public class Compiler {
    public static String studentName = "TODO: Your Name";
    public static String studentID = "TODO: Your 8-digit id";
    public static String uciNetID = "TODO: uci-net id";
	
	public static void main(String[] args)
	{
		/*
		try {
			makeTests(args);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-2);
		}
		*/
		
//		for (int i=1; i<11; ++i) {
//			test(i);
//		}
		
		distributedMain(args);
		
	}
	
	public static void test(Integer testNum)
	{
		String inputFilename = String.format("tests/testP%02d.crx", testNum);
		String outputFilename = String.format("tests/testP%02d.out", testNum);
		String expectedFilename = String.format("tests/test%02d.expected", testNum);
		
		Scanner s = null;
        try {
	        s = new Scanner(new FileReader(inputFilename));
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error accessing the source file: \"" + inputFilename + "\"");
            System.exit(-2);
        }
        
		try {
			PrintStream outputStream = new PrintStream(outputFilename);
	        Token t = s.next();
	        while (!t.is(Token.Kind.EOF)) {
	        	outputStream.println(t.toString());
	            t = s.next();
	        }
	    	outputStream.println(t.toString());
	    	outputStream.close();
		} catch (IOException e) {
            System.err.println("Error opening output file: \"" + outputFilename + "\"");
			e.printStackTrace();
		}
		
		try {
			System.out.println("Test " + testNum);
			Process diff = Runtime.getRuntime().exec("diff " + outputFilename + " " + expectedFilename);
			Thread.sleep(100);
			BufferedReader diffout = new BufferedReader(new InputStreamReader(diff.getInputStream()));
			while(diffout.ready())
				System.out.print((char)diffout.read());
		} catch (IOException e) {
            System.err.println("Error Reading Diff: \"" + expectedFilename + "\"");
			e.printStackTrace();
		} catch (InterruptedException e) {
            System.err.println("Error Sleeping: \"" + expectedFilename + "\"");
			e.printStackTrace();
		}
    }
	
	public static void makeTests(String[] args) throws IOException
	{
		File testdir = new File("/mnt/array/media/Education/UCI/teaching/2012--2013-Q1/CompSci 142A - Compilers and Interpreters/website/labs/lab1/tests");
		
		for (File file : testdir.listFiles())
		{
			if (file.getPath().matches(".*out$"))
				continue;
			
			System.out.println("running: " + file.getPath());
			FileReader reader = new FileReader(file);
			FileWriter writer = new FileWriter(new File(file.getPath().replace(".crx", ".out")));
			
			Scanner scanner = new Scanner(reader);
			for (Token tok : scanner)
				writer.append(tok.toString() + "\n");
			//writer.append(scanner.next().toString());
			writer.close();
		}
	}
	
	public static void distributedMain(String[] args)
    {
        String sourceFile = args[0];
        Scanner s = null;

        try {
            s = new Scanner(new FileReader(sourceFile));
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error accessing the source file: \"" + sourceFile + "\"");
            System.exit(-2);
        }

        Token t = s.next();
        while (!t.is(Token.Kind.EOF)) {
                System.out.println(t);
                t = s.next();
        }
        System.out.println(t);
    }
	
}
