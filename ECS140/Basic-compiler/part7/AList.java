import java.util.*;
import java.lang.*;

public class AList {
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


}
