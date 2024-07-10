Class {
	#name : #CARuleStonerLife,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 15:19'
}
CARuleStonerLife >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me stoneCount chance |
	me := neighborMatrix at: 2 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
	stoneCount := 0.
	1
		to: 3
		do: [:rowIndex | 1
				to: 3
				do: [:colIndex | (neighborMatrix at: rowIndex at: colIndex)
							= CABlocks stone
						ifTrue: [stoneCount := stoneCount + 1]]].
	me = CABlocks stone
		ifTrue: [(stoneCount = 3 or: stoneCount = 4)
				ifTrue: [^ me]
				ifFalse: [^ CABlocks air]]
		ifFalse: [stoneCount = 3
				ifTrue: [^ CABlocks stone]].
	^ me
]
