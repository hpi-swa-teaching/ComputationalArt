Class {
	#name : #CARuleRise,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:55'
}
CARuleRise >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| aboveMe me belowMe risingBlocks |
	aboveMe := neighborMatrix at: 1 at: 2.
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	risingBlocks := OrderedCollection new add: CABlocks smoke;
				 yourself.
	(me = CABlocks air
			and: (risingBlocks includes: belowMe))
		ifTrue: [^ belowMe].
	((risingBlocks includes: me)
			and: (aboveMe = CABlocks air))
		ifTrue: [^ CABlocks air].
	^ me
]
