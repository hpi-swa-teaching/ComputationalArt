Class {
	#name : #CARuleFishSwimLeftEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/14/2024 11:06'
}
CARuleFishSwimLeftEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe leftMe futureLeftMe swimmingBlocks swimmThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimmThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	(((swimmingBlocks includes: rightMe)
			and: (swimmThroughBlocks includes: me))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((swimmThroughBlocks includes: leftMe)
			and: (swimmingBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
