public interface SeqIt{

	// any more elements?
	public boolean hasNext();
	// return the next element and advance iterator to following item.
	
	//part4
	//public int next();
	
	//part5
	public int next() throws UsingIteratorPastEndException;

}
