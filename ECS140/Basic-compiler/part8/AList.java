import java.util.*;
import java.lang.*;

public class AList {
	private AList obj;

	public AList()
	{
		obj = new AList();
	}

	//part 7
	ArrayList<Object> AL = new ArrayList<Object>();

	//overwriting Objects toString method 
	public String toString(){
		
		String stringAL2 = "[ ";

		//case for empty list
		if (AL.size() == 0)
		{
			stringAL2 = stringAL2 + " ";
		}
		
		//concatenating each object into stringAL2
		for (int i = 0; i < AL.size(); i++)
		{
			stringAL2 = stringAL2 + AL.get(i) + " ";
		}
			
		stringAL2 = stringAL2 + "]";
				
		return stringAL2;

	}

	public void add (Seq s) {
		AL.add(s);
	}

	public void add (AList a) {
		AL.add(a);
	}

	public void add (int i) {
		//casting int to Object via use of Integer
		Integer intObj = new Integer(i);
		AL.add(intObj);
	}


	public AList expand ()
	{
		for (int i = 0; i < AL.size(); i++)
		{
			//if Object of type For
			if (AL.get(i) instanceof For)
			{
				int temp = 0;
				ForIt foriterator = ((For)(AL.get(i))).createSeqIt();

				try {
					temp = foriterator.next();
				}
				catch (UsingIteratorPastEndException e) { 
				}

				obj.add(temp);
			}

			//if Object of type Fib
			if (AL.get(i) instanceof Fib)
			{
				int temp = 0;
				FibIt fibiterator = ((Fib)(AL.get(i))).createSeqIt();
				try {
					temp = fibiterator.next();
				}
				catch (UsingIteratorPastEndException e) { 
				}
				obj.add(temp);

			}

			//if Object not of type Fib or For, directly append into newAL
			else
			{
				if (AL.get(i) instanceof Integer)
					obj.add((int)AL.get(i));
				if (AL.get(i) instanceof AList)
					obj.add((AList)AL.get(i));
			}
		}
		return obj;
	}

	/*public AList flatten ()
	{
	}*/

}
