Class {
	#name : #CARuleFluidFlowLeft,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:51'
}
CARuleFluidFlowLeft >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowRightMe leftMe futureLeftMe solidBlocks flowingBlocks flowThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowRightMe := neighborMatrix at: 3 at: 3.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := ThreadSafeRandom value nextInt: 100.
	solidBlocks := OrderedCollection new add: CABlocks sand;
				 add: CABlocks water;
				add: CABlocks wood;
				 yourself.
	flowingBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	flowThroughBlocks := OrderedCollection new add: CABlocks air;
				 add: CABlocks smoke;
				 yourself.
	((((flowingBlocks includes: rightMe)
			and: (solidBlocks includes: belowRightMe))
			and: (flowThroughBlocks includes: me))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((flowThroughBlocks includes: leftMe)
			and: (flowingBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
