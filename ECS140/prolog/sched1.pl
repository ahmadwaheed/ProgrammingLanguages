
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
	L = [H|T],
	H=Pivot,		% if Pivot is at the Head
	Right = T,		% Right is the remaining Tail and Left is empty
	Left =[].
splitlist(L, Left, Pivot, Right) :-
	L = [H|T],
	H\=Pivot,		% If Pivot is not at head, modify the Left List
	splitlist(T, XLeft, Pivot, Right),
	append([H], XLeft, Left).
	

split3list(L, Owner, Left, Pivot, Right) :-
	L = [H|T],
	H = [_X, _Y, Z],
	Owner = Z,		% if owner in the Header List, Pivot is equal to it
	Pivot = H,
	Left = [],		% Left is empty and Right is rest of the original list
	Right = T.

split3list(L, Owner, Left, Pivot, Right) :-
	L = [H|T],
	H = [_X, _Y, Z],
	Owner \= Z, 		% if owner not in the Header List
	split3list(T, Owner, XLeft, Pivot, Right),
	append([H], XLeft, Left).

% Part 4: Returns Permutations of a Given List -----------------------------------------------

perm([], []).
perm(L, PermL) :-
	L = [_H|_T],
	select(E, L, R1),		% picking out E, outputting remaining
	perm(R1, PermLZ),		% permuting on remaining
	PermL = [E | PermLZ].		% cons the 2 together


permsub([], []).
permsub(L, PermL) :-
	L = [_H|_T],
	naaa(L, NAL, _AL), 		% saving nonatom list in NAL from original

	perm(L, PermZ), 		% all permutations
	naaa(PermZ, NALZ, _ALZ), 	% extract nonatom list of this given permutation
	NAL = NALZ,
	
	PermL = PermZ. 			% make sure NAL and NALZ are equal to preserve the non atom list order


% Part 5: Memory Management Predicates ----------------------------------------------------

/*fit1stRequest([Owner, Size], MemList, NewMemList) :-
	MemList = [H|T],
	H = [_X, _Y, _Z],
	split3list(MemList, z, Left, Pivot, Right),
	Pivot = [P1, P2, _P3],

	((Size < P2,
	Block1 = [P1, Size, Owner],
	P1S is (P1 + Size),
	P2S is (P2 - Size),
	Block2 = [P1S, P2S, z],
	B = [Block1 | [Block2]]);

	(Size = P2,
	Block = [P1, Size, Owner],
	B = [Block]);
	
	(fit1stRequest([Owner, Size], T, NewMemList))),
	
	append(Left, B, NM1),
	append(NM1, Right, NewMemList).*/

fit1stRequest([Owner, Size], MemList, NewMemList) :-
	MemList = [H|T],
	H = [A, B, C],
	C=z,

	Size < B,
	Block1 = [A, Size, Owner],
	P1S is (A + Size),
	P2S is (B - Size),
	Block2 = [P1S, P2S, z],
	Bl = [Block1 | [Block2]],
	
	
	append(Bl, T, NewMemList).

fit1stRequest([Owner, Size], MemList, NewMemList) :-
	MemList = [H|T],
	H = [A, B, C],
	C=z,

	Size = B,
	Block = [A, Size, Owner],
	Bl = [Block],
	
	append(Bl, T, NewMemList).
	
fit1stRequest([Owner, Size], MemList, NewMemList) :-
	MemList = [H|T],
	H = [_A, B, C],
	C=z,

	Size > B,
	fit1stRequest([Owner, Size], T, NNN),
	insert(NNN,H,NewMemList).	
	
fit1stRequest([Owner, Size], MemList, NewMemList) :-
	MemList = [H|T],
	H = [_X, _Y, Z],
	(Z \=z -> fit1stRequest([Owner, Size], T, NN)),

	insert(NN,H,NewMemList).
	




% Base Case: if the Head has z and the Tail is empty

fitRelease(Owner, MemList, NewMemList) :-
	MemList = [H|T],
	H=[A, B, C],
	T = [],
	C=Owner,
	R1 = [A,B,z],
	NewMemList=[R1|T].


% If the Head has z, and if the first item of tail may or may not have z
% In short, Appending the current and right

fitRelease(Owner, MemList, NewMemList) :-
	MemList = [H|T],
	H=[A, B, C],
	C=Owner,
	R1 = [A,B,z],
	T = [T1|T2],
	T1 = [_D, E, F],
	((F=z) ->
	(Size is (B+E),
	Block = [A, Size, z],
	NewMemList=[Block|T2]);
	(NewMemList = [R1|T])).
	

% If current is never owner then recurse to find owner.
% After returning from recursion, recursed has z. 
% If current also has z, then append, else return (initial appended with recurse).
% In short, appending previous with current

fitRelease(Owner, MemList, NewMemList) :-
	MemList = [H|T],
	H=[A, B, C],
	C\=Owner,
	fitRelease(Owner, T, Z1),
	Z1 = [H1|T1],
	H1 = [_D,E,F],
	((C=z, F=z)->
	(Size is (B+E),
	Block = [A, Size, z],
	NewMemList=[Block|T1]);
	(NewMemList=[H|Z1])).	
	
% Part 6: Memory Management Predicates ----------------------------------------------------

fitanyRequest([Owner, Size], MemList, NewMemList):-
	MemList = [_H|_T],
	select(E, MemList, NML),
	
	E= [A,B,C],
	
	C=z, Size = B,
	E1 = [A, B, Owner],
	insert(NML, E1, NewMemList).

fitanyRequest([Owner, Size], MemList, NewMemList):-
	MemList = [_H|_T],
	select(E, MemList, NML),
	E= [A,B,C],

	C=z, Size < B,
	PA is (A + Size),
	PB is (B - Size),
	Block1 = [A, Size, Owner],
	Block2 = [PA, PB, z],
	insert(NML, Block1, U1),
	insert(U1, Block2, NewMemList).

% Part 7.1: Memory Management Predicates ----------------------------------------------------
%A
fit1st(RRList, MemList, NewMemList):-
	RRList=[],
	NewMemList=MemList.
	
fit1st(RRList, MemList, NewMemList):-
	
	
	RRList= [H|T],
	RRList \= [],
	(H=[_A,_B]->fit1stRequest(H,MemList,M1);
	(fitRelease(H,MemList,M1))),
	%write(M1 ),nl,
	fit1st(T, M1, M2),
	NewMemList=M2.
	
	
%Part7.2--------------------
fitany(RRList, MemList, NewMemList):-
	RRList=[],
	NewMemList=MemList.
	
fitany(RRList, MemList, NewMemList):-
	
	
	RRList= [H|T],
	RRList \= [],
	(H=[_A,_B]->fitanyRequest(H,MemList,M1);
	(fitRelease(H,MemList,M1))),
	% write(M1),nl,
	fitany(T, M1, M2),
	NewMemList=M2.



% Part 8:  ------------------

/* extractOwner (RRList, OwnerList) :-

    naaa(),

    RRList = [H|T],
    select(E, RRList, RemainOL),

    atom(E) ->
    (extractOwner (T, Z),
    append(Z, H, OwnerList));
    extractOwner (T, OwnerList).*/



%For later if needed
   % select (NP, NewPerm, RemainNP),



/* extract(RRList, Owner, RR2) :-
    RRList = [H|T],
    (H = Owner;
    (H = [X,_], X = Owner)),
    extract(T, Owner, E1),
    RR2 = [H|E1].


helperfunc(Perm1, MemList, Output):-
    naaa(Perm1,_NAL,OwnerList),
    select(EO, OwnerList, _RemainOL),
    extract(Perm1, EO, Z1),
    Z1 = [A|_B],
    \+(atom(A)),
    fit1st(Perm1, MemList, Output).


fit1stTryHarder(RRList, MemList, NewRRList, NewMemList) :-
    RRList = [_H|_T],

    ((fit1st(RRList, MemList, Output)) -> (W=5);

    (perm(RRList, NewPerm),

    helperfunc(NewPerm, MemList, Output),
    NewRRList = NewPerm,
    NewMemList = Output)). */





% Part 8.1 -----------------------------------------------------
% fit1stTryHarder:  First checks whether fit1st on the given RRList and MemList succeeds. If so, then fit1stTryHarder just fails.
% Otherwise, permute on the RRList and call fit1st on each of the valid permutations.


fit1stTryHarder(RRList, MemList, _NewRRList, NewMemList) :-
    fit1st(RRList, MemList, NewMemList), !, fail.

fit1stTryHarder(RRList, MemList, NewRRList, NewMemList) :-
    permsub(RRList, NewRRList),
    fit1st(NewRRList, MemList, NewMemList).


% Part 8.2 -----------------------------------------------------
% Same Logic for fitanyTryHarder.

fitanyTryHarder(RRList, MemList, _NewRRList, NewMemList) :-
    fitany(RRList, MemList, NewMemList), !, fail.

fitanyTryHarder(RRList, MemList, NewRRList, NewMemList) :-
    permsub(RRList, NewRRList),
    fitany(NewRRList, MemList, NewMemList).




