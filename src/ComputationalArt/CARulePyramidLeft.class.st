Class {
	#name : #CARulePyramidLeft,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:52'
}
CARulePyramidLeft >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowMe leftMe belowLeftMe futureLeftMe aboveRightMe futureAboveRightMe pyramidBlocks lightBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowMe := neighborMatrix at: 3 at: 2.
	belowLeftMe := neighborMatrix at: 3 at: 1.
	aboveRightMe := neighborMatrix at: 1 at: 3.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	futureAboveRightMe := newNeighborMatrix at: 1 at: 3.
	chance := ThreadSafeRandom value nextInt: 100.
	pyramidBlocks := OrderedCollection new add: CABlocks sand;
				 add: CABlocks algae;
				 yourself.
	lightBlocks := OrderedCollection new add: CABlocks air;
				 add: CABlocks smoke;
				 add: CABlocks fire;
				 add: CABlocks water;
				 yourself.
	((pyramidBlocks includes: me)
			and: (pyramidBlocks includes: belowMe)
			and: (lightBlocks includes: belowLeftMe)
			and: chance < 10)
		ifTrue: [^ belowLeftMe].
	((pyramidBlocks includes: aboveRightMe)
			and: (lightBlocks includes: futureAboveRightMe))
		ifTrue: [^ aboveRightMe].
	^ me
]
