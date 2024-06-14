Class {
	#name : #CARuleGasFlowRightEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 21:23'
}
CARuleGasFlowRightEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowMe leftMe futureLeftMe flowingBlocks flowThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowMe := neighborMatrix at: 3 at: 2.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	flowingBlocks := OrderedCollection new add: CABlocks smoke;
				 yourself.
	flowThroughBlocks := OrderedCollection new add: CABlocks air;
				 yourself.
	((flowingBlocks includes: me)
			and: (flowThroughBlocks includes: rightMe)
			and: chance < 20)
		ifTrue: [^ rightMe].
	((flowingBlocks includes: leftMe)
			and: (flowThroughBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
