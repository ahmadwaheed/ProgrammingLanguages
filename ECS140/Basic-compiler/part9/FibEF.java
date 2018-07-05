public class FibEF implements EF{

	public AList expandme()
	{
		AList expand_obj = new AList(); //creating new AList specifically for expand()
		AList expand_ret = new AList(); //acts as temp holder for recursing expand()

		int temp = 0;
		FibIt fibiterator = ((Fib)(AL.get(i))).createSeqIt();  //calling Fib's iterator
		try {
			while (true) //read in entire fib sequence, otherwise just 1st or last printed out
			{
				temp = fibiterator.next(); 
				expand_obj.add(temp);
			}
		}
		catch (UsingIteratorPastEndException e) { 
		}
		
		return expand_obj;
	}
	
	public int flattenme()
	{
		return ((Seq)AL.get(i));
	}

}
