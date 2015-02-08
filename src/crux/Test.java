package crux;

import java.util.HashSet;

import crux.Token.Kind;

public class Test {
	public static void main(String[] args)
	{
		for (Kind tok: Token.Kind.values()) {
			System.out.println(tok.name());
		}
		HashSet<Token.Kind> h;
		
		h = new HashSet<Token.Kind>();
		h.add(Token.Kind.IDENTIFIER);
//		{
//	        private static final long serialVersionUID = 1L;
//	        {
//		        add(Token.Kind.IDENTIFIER);
//		    }
//	    };
	    System.out.println(h);
	}	
}
