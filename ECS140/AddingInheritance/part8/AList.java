import java.util.*;
import java.lang.*;

public class AList {

	//part 7
	public ArrayList<Object> AL = new ArrayList<Object>();  //Here, "AL" is ArrayList not AList


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

	//part 8
	public AList expand ()
	{
		AList expand_obj = new AList(); //creating new AList specifically for expand()
		AList expand_ret = new AList(); //acts as temp holder for recursing expand()

		for (int i = 0; i < AL.size(); i++) //iterating through AList
		{
			//if Object in ArrayList of type For..
			if (AL.get(i) instanceof For)    //CASE 1: FOR
			{
				int temp = -99;
				ForIt foriterator = ((For)(AL.get(i))).createSeqIt();  //calling For's iterator through dynmaic binding
			
				try {
					while (true)  //read in entire for sequence, otherwise just 1st printed out
					{
						temp = foriterator.next(); //next() could throw exception, so the try-catch block
						expand_obj.add(temp);
					}
				}
				catch (UsingIteratorPastEndException e) { 
				}
			}

			//if Object in ArrayList of type Fib..
			if (AL.get(i) instanceof Fib)     //CASE 2: FIB
			{
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
			}

			//if Object not of type Fib or For.....
			else
			{
				if (AL.get(i) instanceof Integer)    //CASE 3: regular integer
					expand_obj.add((int)AL.get(i));
					
				if (AL.get(i) instanceof AList)      //CASE 4: AList within original AList (recursion)
				{
					//ex. [3 5]. After calling expand(), will consider as ArrayList where 3,5 are ints
					//expand_ret acts as a temp holder for inner expanded AList
					//adding expand_ret to original expand_obj AList
 
					expand_ret = ((AList)(AL.get(i))).expand();
					expand_obj.add(expand_ret);
				}
			}
		}
		return expand_obj;
	}

	public AList flatten ()
	{
		AList flatten_obj = new AList();  //creating new AList specifically for flatten()
		AList flatten_ret = new AList();  //acts as a temp holder for recursing flatten()

		for (int i = 0; i < AL.size(); i++)
		{
			//if Object in ArrayList of type AList
			if (AL.get(i) instanceof AList)                 //CASE 1: AList within AList (recursion)
			{
				/*flatten_ret = flatten();  .... this is wrong as it calls flatten on entire list instead of each element
				Have to call flatten again on the object i of AL and store into the temp holder, flatten_ret */

				flatten_ret = ((AList)(AL.get(i))).flatten();         //need to specify AL.get(i) is of type AList here, so it can call flatten()
				for (int k = 0; k < (flatten_ret.AL).size(); k++)     //(AList's ArrayList)'s size
				{
					//flatten_obj.AL eliminates the need to specify if object being added is Integer or Seq. 
					//AList is umbrella term/superclass

					//Need to add each element of AL through .get(k) rather than entire AL. 
					//If add entire AL, brackets will show as well, and purpose is to not include them

					(flatten_obj.AL).add((flatten_ret.AL).get(k));
				}
			}
			else
			{
				if (AL.get(i) instanceof Integer)       //CASE 2: regular integer
				{
					flatten_obj.add((int)AL.get(i));
				}
				if (AL.get(i) instanceof Seq)          //CASE 3: FIB or FOR (doesn't matter, just add it)
				{
					flatten_obj.add((Seq)AL.get(i));
				}
			}
		}
		return flatten_obj;
	}

}
