// the Seq base class

public abstract class Seq {

	static int count=0;		//part3 keep track of # objects created
	 
	//part3 constructor which increments the counter
	public Seq(){

		count++;
	}
	
	//part 2
	public abstract int upperBound();

	//part3
	public static int getCount(){

		return count;		
	}

	//part6
	//automatically creates FibIt or ForIt object through downcasting
	public abstract SeqIt createSeqIt();
}


