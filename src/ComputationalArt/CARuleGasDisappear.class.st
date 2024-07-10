Class {
	#name : #CARuleGasDisappear,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:52'
}
CARuleGasDisappear >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me gasBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
	gasBlocks := OrderedCollection new add: CABlocks smoke;
				 yourself.
	((gasBlocks includes: me)
			and: [chance < 2])
		ifTrue: [^ CABlocks air].
	^ me
]
