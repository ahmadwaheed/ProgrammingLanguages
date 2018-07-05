public class ForUser {

	//part 4, modified with try-catch block in part5
	public static int sum1(For r){
		
		ForIt objIt= new ForIt(r);
		int sum=0;		
		
		while(objIt.hasNext()){
			try {
				sum = sum + objIt.next();
			}
			catch (UsingIteratorPastEndException e) {
			}
		}

		return sum;
	}

	//part5
	public static int sum2(For r){
		
		ForIt objIt= new ForIt(r);
		int sum=0;
		
		//try-catch block
		//continuously calling next() in try block until it throws an exception.
		//once exception, it is caught in catch block	
		try {
			while(true){
				sum = sum + objIt.next();
			}
		}
		catch (UsingIteratorPastEndException e) {
		}

		return sum;
	}


}
