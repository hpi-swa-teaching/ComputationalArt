Class {
	#name : #CARuleFishSwimRightEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/14/2024 11:11'
}
CARuleFishSwimRightEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe leftMe futureLeftMe swimmingBlocks swimThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	(((swimmingBlocks includes: me)
			and: (swimThroughBlocks includes: rightMe))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((swimmingBlocks includes: leftMe)
			and: (swimThroughBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
