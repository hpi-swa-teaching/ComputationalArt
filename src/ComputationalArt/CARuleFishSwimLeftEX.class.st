Class {
	#name : #CARuleFishSwimLeftEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/14/2024 12:14'
}
CARuleFishSwimLeftEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe leftMe futureLeftMe swimmingBlocks swimThroughBlocks eatBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := (1 to: 100) atRandom.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	eatBlocks := OrderedCollection new add: CABlocks algae;
				yourself.
	(((swimmingBlocks includes: rightMe)
			and: (eatBlocks includes: me))
			and: chance < 30)
		ifTrue: [^ CABlocks water].
	(((swimmingBlocks includes: rightMe)
			and: (swimThroughBlocks includes: me))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((swimThroughBlocks includes: leftMe)
			and: (swimmingBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
