public class ForUser {

	public static int sum1(For r){
		
		ForIt objIt= new ForIt(r);
		int sum=0;		
		
		//summing up all the objects in for sequence
		while(objIt.hasNext()){

			sum = sum + objIt.next();
		
		}

		return sum;
	}


}
