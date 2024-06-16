Class {
	#name : #CARulePyramidRightEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:54'
}
CARulePyramidRightEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe belowMe leftMe belowRightMe futureLeftMe aboveLeftMe futureAboveLeftMe pyramidBlocks lightBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	belowMe := neighborMatrix at: 3 at: 2.
	belowRightMe := neighborMatrix at: 3 at: 3.
	aboveLeftMe := neighborMatrix at: 1 at: 1.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	futureAboveLeftMe := newNeighborMatrix at: 1 at: 1.
	chance := (1 to: 100) atRandom.
	pyramidBlocks := OrderedCollection new add: CABlocks sand;
				 yourself.
	lightBlocks := OrderedCollection new add: CABlocks air;
				 add: CABlocks smoke;
				 add: CABlocks fire;
				 add: CABlocks water;
				 yourself.
	((pyramidBlocks includes: me)
			and: (pyramidBlocks includes: belowMe)
			and: (lightBlocks includes: belowRightMe)
			and: chance < 10)
		ifTrue: [^ belowRightMe].
	((pyramidBlocks includes: aboveLeftMe)
			and: (lightBlocks includes: futureAboveLeftMe))
		ifTrue: [^ aboveLeftMe].
	^ me
]
