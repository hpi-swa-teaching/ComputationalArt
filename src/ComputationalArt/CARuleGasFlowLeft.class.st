Class {
	#name : #CARuleGasFlowLeft,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 21:17'
}
CARuleGasFlowLeft >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowRightMe leftMe futureLeftMe flowingBlocks flowThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowRightMe := neighborMatrix at: 3 at: 3.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	flowingBlocks := OrderedCollection new add: CABlocks smoke;
				 yourself.
	flowThroughBlocks := OrderedCollection new add: CABlocks air;
				 yourself.
	((flowingBlocks includes: rightMe)
			and: (flowThroughBlocks includes: me)
			and: chance < 20)
		ifTrue: [^ rightMe].
	((flowThroughBlocks includes: leftMe)
			and: (flowingBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
