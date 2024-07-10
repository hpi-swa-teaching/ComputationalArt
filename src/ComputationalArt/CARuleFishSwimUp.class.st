Class {
	#name : #CARuleFishSwimUp,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:51'
}
CARuleFishSwimUp >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
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
	(((eatBlocks includes: me)
			and: (swimmingBlocks includes: belowMe))
			and: chance < 30)
		ifTrue: [^ CABlocks water].
	(((swimThroughBlocks includes: me)
			and: (swimmingBlocks includes: belowMe))
			and: chance < 20)
		ifTrue: [^ belowMe].
	((swimThroughBlocks includes: aboveMe)
			and: (swimmingBlocks includes: futureAboveMe))
		ifTrue: [^ aboveMe].
	^ me
]
