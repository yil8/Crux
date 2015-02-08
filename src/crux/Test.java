package crux;

import crux.Token.Kind;

public class Test {
	public static void main(String[] args)
	{
		for (Kind tok: Token.Kind.values()) {
			System.out.println(tok.name());
		}
	}	
}
