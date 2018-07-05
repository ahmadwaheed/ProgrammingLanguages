public class FibIt implements SeqIt{

	protected Fib f;
	protected int current;
	protected int prev;  //previous 
	public static int flag=0;
	public FibIt(Fib fibObj){

		f=fibObj;
		current=f.fib2;
		prev =f.fib1;
		
	}
	public boolean hasNext(){

		//if current value + step is less than last, then there is a next value

		if ((current) <=f.fibL ||prev<=f.fibL){ 
			
			return true;
		}
		
		else			
		return false;
	}

	public int next() throws UsingIteratorPastEndException{
		if (!hasNext()){
			//exit if there's nothing
			//part4
			//System.err.println("FibIt called past end");
			//System.exit(1);

			//part5
			throw new UsingIteratorPastEndException("");	
		}
		int temp= prev;
		int temp2=current;	
		prev=temp2;
		current=  temp+ temp2;
					
		return temp;
	}


}
