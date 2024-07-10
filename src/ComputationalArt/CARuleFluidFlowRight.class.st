Class {
	#name : #CARuleFluidFlowRight,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:52'
}
CARuleFluidFlowRight >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowMe leftMe futureLeftMe solidBlocks flowingBlocks flowThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowMe := neighborMatrix at: 3 at: 2.
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
