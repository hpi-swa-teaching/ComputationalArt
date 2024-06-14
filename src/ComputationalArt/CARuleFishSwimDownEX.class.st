Class {
	#name : #CARuleFishSwimDownEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/14/2024 12:12'
}
CARuleFishSwimDownEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me belowMe aboveMe futureAboveMe swimmingBlocks swimThroughBlocks eatBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	aboveMe := neighborMatrix at: 1 at: 2.
	futureAboveMe := newNeighborMatrix at: 1 at: 2.
	chance := (1 to: 100) atRandom.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	eatBlocks := OrderedCollection new add: CABlocks algae;
				yourself.
	(((swimmingBlocks includes: me)
			and: (eatBlocks includes: belowMe))
			and: chance < 30)
		ifTrue: [^ CABlocks water].
	(((swimmingBlocks includes: me)
			and: (swimThroughBlocks includes: belowMe))
			and: chance < 20)
		ifTrue: [^ belowMe].
	((swimmingBlocks includes: aboveMe)
			and: (swimThroughBlocks includes: futureAboveMe))
		ifTrue: [^ aboveMe].
	^ me
]
