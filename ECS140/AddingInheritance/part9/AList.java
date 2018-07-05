import java.util.*;
import java.lang.*;

//Part 9 : add "implements EF" for AList case
public class AList implements EF {

	//part 7
	//part 9 modification
	//make ArrayList of EF objects 
	public ArrayList<EF> AL = new ArrayList<EF>();


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
		IntEF intObj = new IntEF(i);
		AL.add(intObj);
	}


	//part9
	public AList expand()
	{
		AList temp_AList = new AList();
		AList temp_obj = new AList();

		for (int i = 0; i < AL.size(); i++) //iterating through AList
		{
			temp_AList = (AL.get(i)).expandme(); //return obj as an AList

			//for loop to remove brackets essentially
			for (int k = 0; k < (temp_AList.AL).size(); k++)
			{
				(temp_obj.AL).add((temp_AList.AL).get(k));  //add each element of AList as in part 8
			}
		}
		return temp_obj; 
	}
	public AList flatten()
	{
		AList temp_AList = new AList(); 
		AList temp_obj = new AList(); 
		for (int i = 0; i < AL.size(); i++) //iterating through AList
		{
			temp_AList = (AL.get(i)).flattenme();
			for (int k = 0; k < (temp_AList.AL).size(); k++)
                        {
                                (temp_obj.AL).add((temp_AList.AL).get(k));  //add each element of AList as in part 8
                        }
		}
		return temp_obj; 
	}


	//AList's version of expandme/flattenme
        public AList expandme()
        {
                AList expand_obj = new AList(); //creating new AList specifically for expand()
                AList expand_ret = new AList(); //acts as temp holder for recursing expand()

                //expand_ret acts as a temp holder for inner expanded AList
                //adding expand_ret to original expand_obj AList

                expand_ret = this.expand();  
                expand_obj.add(expand_ret);

                return expand_obj;
        }


        public AList flattenme()
        {
                AList flatten_obj = new AList();  //creating new AList specifically for flatten()
                AList flatten_ret = new AList();  //acts as a temp holder for recursing flatten()

                flatten_ret = this.flatten();         //already know AL.get(i) is AList here, so call flatten() recursively
		
                for (int k = 0; k < (flatten_ret.AL).size(); k++)     //(AList's ArrayList)'s size
                {
                        //Add each element of flatten_ret to remove brackets
                        (flatten_obj.AL).add((flatten_ret.AL).get(k));
                }

                return flatten_obj;
        }

	//For us: Print out part 8 version of AList for easier readability!
}
