
public class Fib extends Seq{

	protected int fib1;
	protected int fib2;
	protected int fibL;
	static int count=0;



	//constructor part1
	public Fib (int first1, int first2, int last){

		fib1 =first1;	
		fib2 = first2;
		fibL = last;
		count++;

	}

	//overwriting Objects toString method 
	public String toString(){
		
		return String.format("< "+fib1+", "+fib2+" to "+fibL+" >"); 

	}
       //part2 finds upperbound and adding definition of upperbound which is declare in Seq 
	
	public int upperBound(){
		
		return fibL;

	}
	//part3 counting method call
	public static int getCount(){
		
		return count;

	}

	//part6 creating a new FibIt object based on the current Fib, and returning it
	public FibIt createSeqIt() {
		FibIt newIt = new FibIt(this);
		return newIt;
	}

	/*public FibEF createEF()
	{
		FibEF newEF = new FibEF(this);
	}*/

}
