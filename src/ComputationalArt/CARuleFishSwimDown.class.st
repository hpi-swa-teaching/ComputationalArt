Class {
	#name : #CARuleFishSwimDown,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:51'
}
CARuleFishSwimDown >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me belowMe aboveMe futureAboveMe swimmingBlocks swimThroughBlocks eatBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	aboveMe := neighborMatrix at: 1 at: 2.
	futureAboveMe := newNeighborMatrix at: 1 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
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
