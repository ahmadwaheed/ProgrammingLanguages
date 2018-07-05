public class AListEF implements EF{

	public AList expandme()
	{
		AList expand_obj = new AList(); //creating new AList specifically for expand()
		AList expand_ret = new AList(); //acts as temp holder for recursing expand()

		//expand_ret acts as a temp holder for inner expanded AList
		//adding temp expand_ret to original expand_obj AList
 
		expand_ret = ((AList)(AL.get(i))).expand();
		expand_obj.add(expand_ret);

		return expand_obj;
	}


	public AList flattenme()
	{
		AList flatten_obj = new AList();  //creating new AList specifically for flatten()
		AList flatten_ret = new AList();  //acts as a temp holder for recursing flatten()

		flatten_ret = ((AList)(AL.get(i))).flatten();         //already know AL.get(i) is AList here, so call flatten()
		for (int k = 0; k < (flatten_ret.AL).size(); k++)     //(AList's ArrayList)'s size
		{
			//flatten_obj.AL eliminates the need to specify if object being added is Integer or Seq. 
			//AList is umbrella term/superclass

			//Need to add each element of AL through .get(k) rather than entire AL. 
			//If add entire AL, brackets will show as well, and purpose is to not include them

			(flatten_obj.AL).add((flatten_ret.AL).get(k));
		}
			
		return flatten_obj;
	}

}
