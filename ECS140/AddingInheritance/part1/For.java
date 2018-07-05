public class For extends Seq{

	protected int forF;
	protected int forL;
	protected int forS;
	
	//constructor part1 
	public For (int first, int last, int step){

		forF =first;	
		forL = last;
		forS = step;

	}

	//overwriting Objects toString method 
	public String toString(){

		return String.format("{ "+forF+" to "+forL+" by "+forS+" }"); 
	
	}


}

