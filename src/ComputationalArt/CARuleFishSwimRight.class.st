Class {
	#name : #CARuleFishSwimRight,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:51'
}
CARuleFishSwimRight >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| me rightMe leftMe futureLeftMe swimmingBlocks swimThroughBlocks eatBlocks chance |
	me := neighborMatrix at: 2 at: 2.
	rightMe := neighborMatrix at: 2 at: 3.
	leftMe := neighborMatrix at: 2 at: 1.
	futureLeftMe := newNeighborMatrix at: 2 at: 1.
	chance := ThreadSafeRandom value nextInt: 100.
	swimmingBlocks := OrderedCollection new add: CABlocks fish;
				 yourself.
	swimThroughBlocks := OrderedCollection new add: CABlocks water;
				 yourself.
	eatBlocks := OrderedCollection new add: CABlocks algae;
				yourself.
	(((swimmingBlocks includes: me)
			and: (eatBlocks includes: rightMe))
			and: chance < 30)
		ifTrue: [^ CABlocks water].
	(((swimmingBlocks includes: me)
			and: (swimThroughBlocks includes: rightMe))
			and: chance < 20)
		ifTrue: [^ rightMe].
	((swimmingBlocks includes: leftMe)
			and: (swimThroughBlocks includes: futureLeftMe))
		ifTrue: [^ leftMe].
	^ me
]
