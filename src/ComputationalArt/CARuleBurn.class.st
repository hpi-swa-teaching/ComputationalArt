Class {
	#name : #CARuleBurn,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:50'
}
CARuleBurn >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me fireCount chance tempCell |
	me := neighborMatrix at: 2 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
	fireCount := 0.
	1
		to: 3
		do: [:rowIndex | 1
				to: 3
				do: [:colIndex | 
					tempCell := newNeighborMatrix at: rowIndex at: colIndex.
					tempCell = CABlocks fire
						ifTrue: [fireCount := fireCount + 1]]].
	(me = CABlocks wood and: fireCount > 0 and: chance < 10)
		ifTrue: [^ CABlocks fire].
	^ me
]
