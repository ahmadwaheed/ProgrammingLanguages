% Part 1: Simple Queries -----------------------------------------------------------------------

/*names of all national parks*/
np_names(N) :-
	np(N,_,_).

/*names of all national parks other than yosemite*/
np_names_not_yosemite(N) :-
	np(N,_,_),
	N\=yosemite.

/*list of activities available at yosemite*/
np_activities_yosemite(A) :-
	np(N,_,A),
	N=yosemite.

/*list of states for yosemite*/
np_states_yosemite(S) :-
	np(N,S,_),
	N=yosemite.

/*list of states for grandcanyon*/
np_states_grandcanyon(S) :-
	np(N,S,_),
	N=grandcanyon.

/*list of states for national park with name N*/
np_states(N, S) :-
	np(N,S,_).

/*sorted list of activities at yosemite*/
np_sorted_activities_yosemite(SA) :-
	np(N,_,A),
	N=yosemite,
	sort(A, SA).

/*names of parks that are within exactly one state*/
np_single_state(N) :-
	np(N,S,_),
	length(S,1).

/*names of parks that are within two or more states*/
np_multi_state(N) :-
	np(N,S,_),
	length(S,Z),
	Z>1.

/*ordered pairs (each as a list of 2) of names of 2 (different) parks that are within exactly one state that is the same*/
np_pair_names([N1, N2]) :-
	np(N1,S,_),
	np(N2,S,_),
	N1@<N2.

/*names of parks that are within exactly two states and offer exactly two activities*/
np_2_state_2_activities(N) :-
	np(N,S,A),
	length(S,2),
	length(A,2).

/*names of parks that are within exactly one or exactly two states*/
/*1st way using or operator....*/
np_12_states_1or(N) :-
	np(N,S,_),
	length(S,1);
	np(N,S,_),
	length(S,2).

/*2nd way without using or operator....*/
np_12_states_2wo(N) :-
	np(N,S,_),
	length(S,Z),
	Z>0,
	Z<3.


/*names of parks that provide exactly camping and hiking (in either order)*/
/*1st way using or, using 1 rule*/
np_camping_hiking_1or(N) :-
	np(N,_,A),
	A=[camping, hiking];
	np(N,_,A),
	A=[hiking, camping].


/*2nd way without or, using 2 rules*/
np_camping_hiking_2wo(N) :-
	np(N,_,A),
	A=[camping, hiking].

np_camping_hiking_2wo(N) :-
	np(N,_,A),
	A=[hiking, camping].


/*3rd way, using sort*/
np_camping_hiking_sort(N) :-
	np(N,_,A),
	A=[camping, hiking],
	sort(A, SA);

	np(N,_,A),
	A=[hiking, camping],
	sort(A, SA).


% Part 2: Basic Lists -----------------------------------------------------------------------

insert([],E,[E]).
insert(L,E,Z) :-
	L = [_H|_T],
	append(L,[E],Z1),
	sort(Z1,Z).


% first case is taking care of not returning last. Returns empty list rather than last element.
butlast([_X],[]).
butlast([H|T],Z) :-
	butlast(T,Z1),
	Z = [H|Z1].	


% 1) if H=atom, then AL output list only cares about possibly modified ALZ, and append both together.
% 2) Same for nonatom. Recursion first, then append. Order of args in append matters.
naaa([],[],[]).
naaa([H|T],NAL,AL) :-
	atom(H),
	naaa(T, NAL, ALZ),
	append([H], ALZ, AL).
	
naaa([H|T],NAL,AL) :-
	\+(atom(H)),
	naaa(T, NALZ, AL),
	append([H], NALZ, NAL).


% Part 3: Splitting Lists -----------------------------------------------------------------------

splitlist(L, Left, Pivot, Right) :-
	L = [H|T],   % making a list 
	H = Pivot,   % if pivot is at the head
	Right = T,   % Right is remaining tail and left is empty
	Left = []. 

splitlist(L, Left, Pivot, Right) :-
	L = [H|T],
	H\= Pivot, % If pivot is not at head, modify the left list
	splitlist(T, XLeft, Pivot, Right),
	append([H], XLeft, Left).


split3list(L, Owner, Left, Pivot, Right) :-
	L = [H|T],
	H = [_X, _Y, Z],
	Owner = Z, % if owner in the Header List, Pivot is equal to it
	Pivot = H,
	Left = [], % Left is empty and right is rest of the original list
	Right = T.

split3list(L, Owner, Left, Pivot, Right) :-
	L = [H|T],
	H = [_X, _Y, Z],
	Owner \= Z, % if owner not in the header list
	split3list(T, Owner, XLeft, Pivot, Right),
	append([H], XLeft, Left).




	

