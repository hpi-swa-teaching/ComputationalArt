Class {
	#name : #CARuleTntSpread,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:53'
}
CARuleTntSpread >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me tntCount chance tempCell poofBlocks |
	me := neighborMatrix at: 2 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
	poofBlocks := OrderedCollection new add: CABlocks air;
	add: CABlocks air;
				 add: CABlocks smoke;
				 add: CABlocks fire;
				 add: CABlocks tnt;
				 yourself.
	tntCount := 0.
	1
		to: 3
		do: [:rowIndex | 1
				to: 3
				do: [:colIndex | 
					tempCell := newNeighborMatrix at: rowIndex at: colIndex.
					tempCell = CABlocks tnt
						ifTrue: [tntCount := 1]]].
	(tntCount = 1 and: me ~= CABlocks tnt)
		ifTrue: [^ poofBlocks atRandom].
	me = CABlocks tnt
		ifTrue: [^ CABlocks air].
	^ me
]
