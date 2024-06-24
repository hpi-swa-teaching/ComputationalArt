Class {
	#name : #CARuleGasDisappear,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 21:33'
}
CARuleGasDisappear >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me gasBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	chance := (1 to: 100) atRandom.
	gasBlocks := OrderedCollection new add: CABlocks smoke;
				 yourself.
	((gasBlocks includes: me)
			and: [chance < 2])
		ifTrue: [^ CABlocks air].
	^ me
]
