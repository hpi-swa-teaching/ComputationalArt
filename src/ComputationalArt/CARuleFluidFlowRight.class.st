Class {
	#name : #CARuleFluidFlowRight,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 22:02'
}
CARuleFluidFlowRight >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowMe leftMe futureLeftMe solidBlocks flowingBlocks flowThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowMe := neighborMatrix at: 3 at: 2.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	solidBlocks := OrderedCollection new add: CABlocks sand;
				 add: CABlocks water;
				add: CABlocks wood;
				 yourself.
	flowingBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	flowThroughBlocks := OrderedCollection new add: CABlocks air;
				 add: CABlocks smoke;
				 yourself.
	((((flowingBlocks includes: me)
			and: (solidBlocks includes: belowMe))
			and: (flowThroughBlocks includes: rightMe))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((flowingBlocks includes: leftMe)
			and: (flowThroughBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
