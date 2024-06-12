Class {
	#name : #CARuleFallDownEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 21:40'
}
CARuleFallDownEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| aboveMe me belowMe fallingBlocks fallingThroughBlocks |
	aboveMe := neighborMatrix at: 1 at: 2.
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	fallingBlocks := OrderedCollection new add: CABlocks sand;
				 add: CABlocks water;
				 add: CABlocks algae;
				add: CABlocks fire;
				 yourself.
	fallingThroughBlocks := OrderedCollection new add: CABlocks air;
				 add: CABlocks smoke;
				 yourself.
	((fallingThroughBlocks includes: me)
			and: [fallingBlocks includes: aboveMe])
		ifTrue: [^ aboveMe].
	((fallingBlocks includes: me)
			and: [fallingThroughBlocks includes: belowMe])
		ifTrue: [^ belowMe].
	^ me
]
