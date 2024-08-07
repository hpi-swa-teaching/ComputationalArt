Class {
	#name : #CARuleFireOut,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:50'
}
CARuleFireOut >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me waterCount woodCount chance tempCell |
	me := neighborMatrix at: 2 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
	waterCount := 0.
	1
		to: 3
		do: [:rowIndex | 1
				to: 3
				do: [:colIndex | 
					tempCell := newNeighborMatrix at: rowIndex at: colIndex.
					tempCell = CABlocks water
						ifTrue: [waterCount := waterCount + 1]]].
	(me = CABlocks fire and: waterCount > 0)
		ifTrue: [^ CABlocks smoke].
	woodCount := 1.
	1
		to: 3
		do: [:rowIndex | 1
				to: 3
				do: [:colIndex | 
					tempCell := newNeighborMatrix at: rowIndex at: colIndex.
					tempCell = CABlocks wood
						ifTrue: [woodCount := woodCount + 1]]].
	(me = CABlocks fire and: woodCount * chance < 5)
		ifTrue: [^ CABlocks smoke].
	^ me
]
