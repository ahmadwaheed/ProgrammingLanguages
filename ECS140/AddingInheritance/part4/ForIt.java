public class ForIt implements SeqIt{
	
	protected For f;
	protected int count;
	
	public ForIt(For forObj)
	{
		f = forObj;
		count = 0;
	}	

	public boolean hasNext(){

		//if current value + step is less than last, then there is a next value
		int current = f.forF + (f.forS * count);
		if (f.forS >=0 && current<= f.forL){ 
			return true;
		}
		if (f.forS <0 && current >= f.forL){ 
			return true;
		}
		return false;
	}

	public int next(){
		if (!hasNext()){
				//exit if there's nothing
				System.err.println("ForIt called past end");
				System.exit(1);	
			}
		//add step*(# of iterations) to the initial value to get the next value
		return f.forF + (f.forS * count++);
	}

}
