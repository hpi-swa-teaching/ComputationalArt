Class {
	#name : #CARuleFishDie,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:50'
}
CARuleFishDie >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me belowMe aboveMe rightMe leftMe futureAboveMe swimmingBlocks swimThroughBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	aboveMe := neighborMatrix at: 1 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureAboveMe := newNeighborMatrix at: 1 at: 2.
	chance := ThreadSafeRandom value nextInt: 100.
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
