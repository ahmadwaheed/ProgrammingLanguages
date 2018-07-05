// the Seq base class

//Part 9 : add "implements EF" for Seq case
public abstract class Seq implements EF {

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



	//AList's version of expandme/flattenme
        public AList expandme()
        {
		//purpose: expand for/fib

                AList expand_ret = new AList(); //acts as temp holder for recursing expand()

                int temp = 0;
                SeqIt iterator = createSeqIt();  //already knows object is of type Seq, and through dynamic binding, automatically creates a for or fib iterator object
                try {
                        while (true) //read in entire for/fib sequence, otherwise just 1st or last printed out
                        {
                                temp = iterator.next(); //Either for's or fib's next() called through dynamic binding
                                expand_ret.add(temp);
                        }
                }
                catch (UsingIteratorPastEndException e) {
                }

                return expand_ret;
        }

        public AList flattenme()
        {
		//purpose: return object as is

		AList temp = new AList();
		temp.add(this);
		return temp;
        }

}



