Class {
	#name : #CARuleFishDieEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/14/2024 11:54'
}
CARuleFishDieEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me belowMe aboveMe rightMe leftMe futureAboveMe swimmingBlocks swimThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	aboveMe := neighborMatrix at: 1 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureAboveMe := newNeighborMatrix at: 1 at: 2.
	chance := (1 to: 100) atRandom.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	((((((swimmingBlocks includes: me) 
			and: ((swimThroughBlocks includes: belowMe) not)) 
			and: ((swimThroughBlocks includes: rightMe) not)) 
			and: ((swimThroughBlocks includes: leftMe) not)) 
			and: ((swimThroughBlocks includes: aboveMe) not)) 
			and: chance < 5)
		ifTrue: [^ CABlocks air].
	^ me
]
