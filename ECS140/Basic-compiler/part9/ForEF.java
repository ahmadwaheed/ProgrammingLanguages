public class ForEF implements EF{
	
	public AList expandme()
	{
		AList expand_obj = new AList(); //creating new AList specifically for expand()
		AList expand_ret = new AList(); //acts as temp holder for recursing expand()

		//if Object in ArrayList of type For..
		int temp = -99;
		ForIt foriterator = ((For)(AL.get(i))).createSeqIt();  //calling For's iterator
		
		try {
			while (true)  //read in entire for sequence, otherwise just 1st or last printed out
			{
				temp = foriterator.next(); //next() could throw exception, so the try-catch block
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
