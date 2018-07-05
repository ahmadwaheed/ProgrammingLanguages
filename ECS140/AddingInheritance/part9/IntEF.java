//Part 9 : add "implements EF" for IntEF case\

/*Need IntEF class to take care of Integer part
(add functions like expandme() and flattenme() */

public class IntEF implements EF{

	private Integer i; //had to convert int --> Integer in order to use toString()
	
	//constructor
	public IntEF (int j)
	{
		i = j; //returning the default int value
	}

	//AList's version of expandme/flattenme
	public AList expandme()
	{
		AList temp = new AList();
                temp.add(i);
                return temp;  //returning expanded version of int passed in as is (no effect)

	}
	public AList flattenme()
	{
		AList temp = new AList();
                temp.add(i);
                return temp;  //returning flattened version of int passed in as is (no effect)
	}

	//override toString() to convert Integer to a String, so prints out the string version of i rather than the address of i
	public String toString(){
		return i.toString();
	}

}
