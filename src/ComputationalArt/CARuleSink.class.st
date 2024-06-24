Class {
	#name : #CARuleSink,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:56'
}
CARuleSink >> applyRuleWith: neighborMatrix and: newNeighborMatrix [ 
	| aboveMe me belowMe sinkingBlocks sinkThroughBlocks |
	aboveMe := neighborMatrix at: 1 at: 2.
	me := neighborMatrix at: 2 at: 2.
	belowMe := neighborMatrix at: 3 at: 2.
	sinkingBlocks := OrderedCollection new add: CABlocks sand;
				 yourself.
	sinkThroughBlocks := OrderedCollection new add: CABlocks water;
				 add: CABlocks fire;
				 yourself.
	((sinkThroughBlocks includes: me)
			and: (sinkingBlocks includes: aboveMe))
		ifTrue: [^ aboveMe].
	((sinkingBlocks includes: me)
			and: (sinkThroughBlocks includes: belowMe))
		ifTrue: [^ belowMe].
	^ me
]
