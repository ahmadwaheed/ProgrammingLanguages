
public class Fib extends Seq{

	protected int fib1;
	protected int fib2;
	protected int fibL;

	//constructor part1
	public Fib (int first1, int first2, int last){

		fib1 =first1;	
		fib2 = first2;
		fibL = last;

	}

	//overwriting Objects toString method 
	public String toString(){
		
		return String.format("< "+fib1+", "+fib2+" to "+fibL+" >"); 

	}

	
}
