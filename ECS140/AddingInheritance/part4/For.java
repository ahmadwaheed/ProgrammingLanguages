public class For extends Seq{

	protected int forF;
	protected int forL;
	protected int forS;
	static int count=0;
	
	//constructor part1 
	public For (int first, int last, int step){

		forF =first;	
		forL = last;
		forS = step;
		count++;

	}

	//overwriting Objects toString method 
	public String toString(){

		return String.format("{ "+forF+" to "+forL+" by "+forS+" }"); 
	
	}

	//part2 finds upperbound and adding definition of upperbound which is declared in Seq 
	public  int upperBound(){
		
		if (forS>0){
			return forL;
		}
		else{
			return forF;
		}

	}

	//part3 counting method call
	public static int getCount(){

		return count;

	}

}

